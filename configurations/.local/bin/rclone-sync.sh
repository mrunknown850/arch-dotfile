#!/usr/bin/env bash
#
# rclone-sync — OneDrive bisync controller (UI-agnostic)
#
# Usage:
#   rclone-sync status        Print one JSON line with the current state, exit 0
#   rclone-sync watch         Print a JSON line now and on every state change (long-running)
#   rclone-sync run           Run a bisync (blocks until done), JSON line on start and end
#   rclone-sync unlock        Remove a stale rclone bisync lock (refuses while syncing)
#   rclone-sync log [N]       Print the last N (default 50) lines of the sync log
#
# JSON schema (status / watch / run):
#   {
#     "state":      "idle" | "syncing" | "error",
#     "exit_code":  int | null,    # exit code of the last finished run
#     "last_start": epoch | null,  # start time of the last finished run
#     "last_end":   epoch | null   # end time of the last finished run
#   }
#
# Exit codes of `run`:
#   0   success
#   75  another sync is already running (nothing was done)
#   *   otherwise rclone's own exit code
#
# Rules: stdout = machine-readable only, human-readable diagnostics -> stderr,
# rclone's own output -> log file. No notifications.

set -uo pipefail

# ---- config (override via environment) -------------------------------------
LOCAL_DIR="${RCLONE_SYNC_LOCAL:-$HOME/OneDrive}"
REMOTE="${RCLONE_SYNC_REMOTE:-onedrive:}"
EXCLUDE="${RCLONE_SYNC_EXCLUDE:-Personal Vault/}"
WATCH_INTERVAL="${RCLONE_SYNC_INTERVAL:-1}"

# rclone's own bisync lock files; glob must only match THIS job's lock
BISYNC_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/rclone/bisync"
BISYNC_LCK_GLOB="${RCLONE_SYNC_LCK_GLOB:-*OneDrive*.lck}"

STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/rclone-sync"
STATE_FILE="$STATE_DIR/last_run.json"
LOG_FILE="$STATE_DIR/sync.log"
LOG_MAX_BYTES=$((1024 * 1024))
LOCK_FILE="${XDG_RUNTIME_DIR:-/tmp}/rclone-sync.lock"

# ---- helpers ---------------------------------------------------------------
log() { printf '%s\n' "$*" >&2; }

# A sync is running iff someone holds our flock. (Unlike `pgrep rclone`, this
# ignores unrelated rclone processes such as mounts.)
is_running() { ! ( flock -n 9 ) 9>"$LOCK_FILE"; }

emit_status() {
  local last='{}' running=false
  if [[ -s $STATE_FILE ]] && jq -e . "$STATE_FILE" >/dev/null 2>&1; then
    last=$(<"$STATE_FILE")
  fi
  is_running && running=true

  jq -cn --argjson last "$last" --argjson running "$running" '
    {
      state: (if $running then "syncing"
              elif ($last.exit_code // 0) != 0 then "error"
              else "idle" end),
      exit_code:  ($last.exit_code // null),
      last_start: ($last.started   // null),
      last_end:   ($last.ended     // null)
    }'
}

record_result() { # exit_code started ended
  local tmp
  tmp=$(mktemp "$STATE_DIR/.last_run.XXXXXX") || return 1
  jq -cn --argjson c "$1" --argjson s "$2" --argjson e "$3" \
    '{exit_code: $c, started: $s, ended: $e}' >"$tmp" && mv -f "$tmp" "$STATE_FILE"
}

rotate_log() {
  [[ -f $LOG_FILE ]] || return 0
  local size
  size=$(stat -c %s "$LOG_FILE" 2>/dev/null || echo 0)
  ((size > LOG_MAX_BYTES)) && mv -f "$LOG_FILE" "$LOG_FILE.1"
}

clear_bisync_lock() {
  # Only call while holding $LOCK_FILE, so we know none of our syncs is active.
  local f
  for f in "$BISYNC_CACHE"/$BISYNC_LCK_GLOB; do
    [[ -e $f ]] || continue
    log "removing stale bisync lock: $f"
    rm -f -- "$f"
  done
  return 0
}

# ---- subcommands -----------------------------------------------------------
cmd_status() { emit_status; }

cmd_watch() {
  local last='' cur
  while :; do
    cur=$(emit_status)
    if [[ $cur != "$last" ]]; then
      printf '%s\n' "$cur"
      last=$cur
    fi
    sleep "$WATCH_INTERVAL"
  done
}

cmd_run() {
  mkdir -p "$STATE_DIR"

  exec 9>"$LOCK_FILE"
  if ! flock -n 9; then
    log "sync already in progress"
    emit_status
    return 75
  fi

  rotate_log
  clear_bisync_lock

  local started ended code
  started=$(date +%s)
  emit_status # state = syncing (we hold the lock)

  {
    printf '=== %s sync start ===\n' "$(date -Is)"
    rclone bisync "$LOCAL_DIR" "$REMOTE" \
      --exclude "$EXCLUDE" \
      --fast-list \
      --resilient \
      --recover \
      --create-empty-src-dirs \
      --conflict-resolve newer \
      --verbose
  } >>"$LOG_FILE" 2>&1
  code=$?
  ended=$(date +%s)

  record_result "$code" "$started" "$ended"
  flock -u 9 # release first so the final status reads idle/error
  emit_status
  return "$code"
}

cmd_unlock() {
  exec 9>"$LOCK_FILE"
  if ! flock -n 9; then
    log "sync is running, not unlocking"
    return 1
  fi
  clear_bisync_lock
}

cmd_log() { tail -n "${1:-50}" "$LOG_FILE" 2>/dev/null; }

# ---- dispatch --------------------------------------------------------------
mkdir -p "$STATE_DIR"

case "${1:-status}" in
  status) cmd_status ;;
  watch)  cmd_watch ;;
  run)    cmd_run ;;
  unlock) cmd_unlock ;;
  log)    shift; cmd_log "$@" ;;
  -h | --help | help) sed -n '3,26p' "$0" | sed 's/^# \{0,1\}//' ;;
  *) log "unknown command: $1 (try: status | watch | run | unlock | log)"; exit 2 ;;
esac
