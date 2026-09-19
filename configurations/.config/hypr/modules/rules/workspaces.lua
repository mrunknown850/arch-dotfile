--#########################
-- HYPRLAND WORKSPACES RULE
--#########################

hl.workspace_rule({
	workspace = "special:chat",
	layout = "scrolling",
	layout_opts = {
		column_width = 1,
	},
})

hl.workspace_rule({
	workspace = "special:term",
	layout = "scrolling",
	layout_opts = {
		column_width = 0.5,
	},
})

for i = 1, 5 do
	if i ~= 3 then
		hl.workspace_rule({
			workspace = i,
			layout = "dwindle",
		})
	end
end

hl.workspace_rule({
	workspace = "3",
	layout = "master",
	default = true,
	layout_opts = {
		orientation = "left",
	},
	monitor = "eDP-1",
	default = true,
})

-- Float default on magic
-- hl.window_rule({ matchworkspace = "special:magic", float = true })
hl.window_rule({
	match = { workspace = "3" },
	opacity = "1.0 1.0 1.0",
})

hl.window_rule({
	match = { workspace = "special:magic" },
	float = true,
	size = { 800, 600 },
})

-- Smart Gaps
hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, rounding = 0 })
