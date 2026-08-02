--#########################
-- HYPRLAND WINDOWS RULE
--#########################

-- Global
hl.window_rule({
	name = "Floating rules",
	match = { float = 1 },
	opacity = "0.95 0.7 1.0",
})

-- App specific
hl.window_rule({
	name = "Thunderbird",
	match = { class = "org.mozilla.Thunderbird" },
	workspace = "special:chat",
})

hl.window_rule({
	name = "Zoom gadgets",
	match = { class = "zoom" },
	float = true,
})

hl.window_rule({
	name = "Zoom",
	match = {
		class = "zoom",
		title = "Meeting",
		fullscreen = true,
	},
})
