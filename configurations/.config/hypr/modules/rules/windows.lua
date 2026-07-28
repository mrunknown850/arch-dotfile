--#########################
-- HYPRLAND WINDOWS RULE
--#########################

-- Global
hl.window_rule({
	name = "Floating rules",
	match = { float = 1 },
	opacity = "0.95 0.7 1.0",
})

-- Application specific
hl.window_rule({
	match = { class = "org.fcitx.fcitx5-config-qt" },
	float = true,
})

hl.window_rule({
	match = { class = "blueman-manager" },
	float = true,
})

hl.window_rule({
	match = { class = "net.lutris.Lutris" },
	float = true,
})

hl.window_rule({
	match = { class = "zoom" },
	float = true,
})

hl.window_rule({
	match = { class = "kitty" },
	float = true,
	size = "(monitor_w*0.5) (monitor_h*0.5)",
})

hl.window_rule({
	match = { class = "steam" },
	float = true,
})
