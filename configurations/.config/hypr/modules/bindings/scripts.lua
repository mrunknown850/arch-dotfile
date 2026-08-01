--##
-- HYPRLAND SCRIPT-BOUNDED BINDINGS
--##

-- Variables
local volume_script = "$HOME/.config/hypr/scripts/volume"
local backlight_script = "$HOME/.config/hypr/scripts/backlight"
local shifter = "$HOME/.config/hypr/shift-workspace.sh"
local clipboard = "cliphist list | rofi -dmenu | cliphist decode | wl-copy"
local clear_cb = "cliphist wipe"
local terminal = "uwsm app -- kitty -d=last_reported"
local fileManager = "uwsm app -- nautilus"
local emoji = "bemoji -n"
local menu = 'pkill rofi || rofi -icon-theme "Papirus" -show drun -run-command "uwsm app -- {cmd}"'
local power = 'pkill rofi || rofi -icon-theme "Papirus" -show powermenu'

-- Quick launch
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))

hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd(power), { release = true })

-- Keyboard stuffs
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd(emoji))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))
hl.bind(mainMod .. " + ALT + V", hl.dsp.exec_cmd(clear_cb))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(volume_script .. " --inc"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(volume_script .. " --dec"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(volume_script .. " --toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(volume_script .. " --toggle-mic"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(backlight_script .. " --inc"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(backlight_script .. " --dec"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -o ~/Pictures/Screenshots -m output"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -o ~/Pictures/Screenshots -m region"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -o ~/Pictures/Screenshots -m output -m active"))
