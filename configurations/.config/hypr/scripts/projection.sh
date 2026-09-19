#!/usr/bin/env bash

# Fetch monitors in JSON format
MONITORS_JSON=$(hyprctl monitors all -j)

# Extract the primary (first monitor in the JSON array)
PRIMARY=$(echo "$MONITORS_JSON" | jq -r '.[0].name')

# Extract the external (second monitor in the JSON array, if present)
EXTERNAL=$(echo "$MONITORS_JSON" | jq -r '.[1].name')
# echo "$EXTERNAL" > /tmp/external_monitor.tmp

# Check if an external monitor is actually connected
if [[ -z "$EXTERNAL" || "$EXTERNAL" == "null" ]]; then
    echo "Error: Only one monitor detected ($PRIMARY). No external monitor found."
    notify-send "Projection" "Second monitor isn't available."
    exit 1
fi

case "$1" in
  extend)
    echo "Extending displays ($PRIMARY + $EXTERNAL)..."
    notify-send "Projection" "Extending displays ($PRIMARY + $EXTERNAL)..."
    hyprctl eval "hl.monitor({output='$PRIMARY',mode='preferred',mirror='',disabled=false})"
    hyprctl eval "hl.monitor({output='$EXTERNAL',mode='preferred',mirror='',disabled=false})"
    ;;
  mirror|duplicate)
      echo "Mirroring $PRIMARY to $EXTERNAL..."
      notify-send "Projection" "Mirroring $PRIMARY to $EXTERNAL..."
      hyprctl eval "hl.monitor({output='$PRIMARY',mode='preferred',mirror='',disabled=false})"
      hyprctl eval "hl.monitor({output='$EXTERNAL',mode='preferred',mirror='$PRIMARY',disabled=false})"
      ;;
  second-only|external)
      echo "$EXTERNAL only..."
      notify-send "Projection" "$EXTERNAL only..."
      hyprctl eval "hl.monitor({output='$PRIMARY',mode='preferred',mirror='',disabled=true})"
      hyprctl eval "hl.monitor({output='$EXTERNAL',mode='preferred',mirror='$PRIMARY',disabled=false})"
      ;;
  restore|reset)
      echo "$PRIMARY only..."
      notify-send "Projection" "$PRIMARY only..."
      hyprctl eval "hl.monitor({output='$PRIMARY',mode='preferred',mirror='',disabled=false})"
      hyprctl eval "hl.monitor({output='$EXTERNAL',mode='preferred',mirror='',disabled=true})"
      ;;
  *)
      echo "Usage: $0 {extend|mirror|second-only|restore}"
      exit 1
      ;;
esac
