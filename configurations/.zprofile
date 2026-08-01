#!/usr/bin/zsh

if [ "$(tty)" = "/dev/tty1" ]; then
    if uwsm check may-start && uwsm select; then
        exec uwsm start /usr/share/wayland-sessions/hyprland-uwsm.desktop
    fi
fi
