--##
-- HYPRLAND SCRIPT-BOUNDED BINDINGS
--##

-- Variables
local emoji = "rofimoji --action clipboard"
local volume_script = "$HOME/.config/hypr/scripts/volume.sh"
local backlight_script = "$HOME/.config/hypr/scripts/backlight.sh"
local clipboard = "cliphist list | rofi -dmenu | cliphist decode | wl-copy"
local clear_cb = "cliphist wipe && notify-send 'Clipboard Cleared'"
local terminal = "uwsm app -- kitty -d=last_reported"
local fileManager = "uwsm app -- yazi"
local menu = 'pkill rofi || rofi -icon-theme "Papirus" -show drun -run-command "uwsm app -- {cmd}"'
local power = 'pkill rofi || rofi -icon-theme "Papirus" -show powermenu'
local projection = 'pkill rofi || rofi -icon-theme "Papirus" -show projection'

-- Quick launch
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))

hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd(power), { release = true })
hl.bind("XF86Display", hl.dsp.exec_cmd(projection))

-- Keyboard stuffs
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(clear_cb))
hl.bind("CTRL + PERIOD", hl.dsp.exec_cmd(emoji))

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

hl.bind(mainMod .. " + F12", function()
	hl.timer(function()
		hl.dispatch(hl.dsp.dpms({ action = "disable" }))
	end, { timeout = 500, type = "oneshot" })
end)
