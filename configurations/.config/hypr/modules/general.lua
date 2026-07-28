--#########################
-- HYPRLAND GENERAL CONFIG
--#########################

hl.config({
	-- General
	general = {
		gaps_in = 1,
		gaps_out = 3,
		border_size = 1,
		resize_on_border = true,
		allow_tearing = true,
		layout = "dwindle",
	},
	animations = {
		enabled = true,
	},

	-- Group control
	group = {
		groupbar = {
			font_size = 12,
			stacked = true,
			indicator_gap = -17,
			indicator_height = 21,
		},
	},

	-- Layout specific
	master = {
		new_status = "master",
	},

	-- Misc
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		animate_manual_resizes = true,
		focus_on_activate = false,
	},
})
