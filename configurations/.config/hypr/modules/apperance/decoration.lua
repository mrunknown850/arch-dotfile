--##
-- HYPRLAND DECORATION SETTINGS
--##

hl.config({
	decoration = {
		rounding = 4,
		rounding_power = 2,
		-- Change transparency of focused and unfocused windows
		active_opacity = 0.9,
		inactive_opacity = 0.95,
		dim_inactive = true,
		dim_strength = 0.05,
		shadow = {
			enabled = false,
			range = 4,
			render_power = 2,
		},
		-- https://wiki.hyprland.org/Configuring/Variables/#blur
		blur = {
			enabled = true,
			size = 8,
			passes = 1,
			--xray = true
			vibrancy = 0.1696,
		},
	},
})
