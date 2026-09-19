#!/usr/bin/env luajit

local options = {
	{
		name = "Primary only",
		icon = "view-refresh-symbolic",
		command = "~/.config/hypr/scripts/projection.sh reset >/dev/null",
	},
	{
		name = "Duplicate",
		icon = "edit-copy",
		command = "~/.config/hypr/scripts/projection.sh duplicate >/dev/null",
	},
	{
		name = "Extend",
		icon = "display-symbolic",
		command = "~/.config/hypr/scripts/projection.sh extend >/dev/null",
	},
	{
		name = "Secondary only",
		icon = "video-single-display-symbolic",
		command = "~/.config/hypr/scripts/projection.sh external >/dev/null",
	},
}

for i, opt in ipairs(options) do
	if arg[1] then
		if opt.name == arg[1] then
			os.execute(opt.command)
		end
	else
		print(opt.name .. "\0icon\x1f" .. opt.icon)
	end
end
