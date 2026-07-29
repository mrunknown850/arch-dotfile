#!/usr/bin/env bash

# notify-send "$1"
tee ~/.config/hypr/hyprpaper.conf > /dev/null <<EOF
wallpaper {
  monitor =
  path = $1
}
EOF

hyprctl hyprpaper wallpaper ",$1,"
