--#########################
-- HYPRLAND WINDOWS RULE
--#########################

-- Global
hl.window_rule({
	name = "Floating rules",
	match = { float = 1 },
	opacity = "0.95 0.7 1.0",
})

-- Chat app filter
hl.window_rule({
	name = "Chats",
	match = {
		title = "^(Zalo|Messenger|Discord)$",
	},
	workspace = "special:chat",
})

-- Media
hl.window_rule({
	name = "Media",
	match = {
		title = "^(YouTube Music)$",
	},
	workspace = "special:media",
})

-- App specific
hl.window_rule({
	name = "Zoom",
	match = { class = "zoom" },
	workspace = 2,
})

-- Zoom stuffs
hl.window_rule({
	match = { class = "^(zoom)$" },
	float = true,
	suppress_event = "maximize",
})

-- Terminal xdg
hl.window_rule({
	match = { title = "termfilechooser" },
	float = true,
	max_size = { 1000, 600 },
	size = { 1000, 600 },
})
