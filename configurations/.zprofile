#!/usr/bin/zsh

if [ "$(tty)" = "/dev/tty1" ]; then
    if uwsm check may-start && uwsm select; then
        exec uwsm start /usr/share/wayland-sessions/hyprland-uwsm.desktop
    fi
fi

# Created by `pipx` on 2026-08-23 02:56:52
export PATH="$PATH:/home/mrunknown850/.local/bin"
