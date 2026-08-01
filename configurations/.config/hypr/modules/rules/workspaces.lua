--#########################
-- HYPRLAND WORKSPACES RULE
--#########################

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
})

-- Smart Gaps
hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, rounding = 0 })
