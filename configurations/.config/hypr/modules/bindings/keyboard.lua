-- =========================================
-- =============== WINDOWS =================
-- =========================================

-- Actions
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen("0"))
hl.bind(mainMod .. " + SHIFT + space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pin())

-- Navigations
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "d" }))

-- Resize mode
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	hl.bind("l", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
	hl.bind("h", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })

	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("return", hl.dsp.submap("reset"))
end)

-- =========================================
-- =============== LAYOUT ==============
-- =========================================

-- Dwindle Layout
hl.bind(mainMod .. " + S", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pseudo("toggle"))

-- Master Layout
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.layout("swapwithmaster"))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.layout("orientationnext"))
hl.bind(mainMod .. " + U", hl.dsp.layout("addmaster"))
hl.bind(mainMod .. " + I", hl.dsp.layout("removemaster"))

-- Groups
hl.bind(mainMod .. " + T", hl.dsp.group.toggle())
hl.bind(mainMod .. " + ALT + L", hl.dsp.group.next())
hl.bind(mainMod .. " + ALT + H", hl.dsp.group.prev())

-- =========================================
-- =============== WORKSPACES ==============
-- =========================================
for i = 1, 5 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + CTRL + L", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "previous" }))

-- =========================================
-- =============== WORKSPACES ==============
-- =========================================
hl.bind(mainMod .. " + grave", hl.dsp.workspace.toggle_special("term"))
hl.bind(mainMod .. " + SHIFT + grave", hl.dsp.window.move({ workspace = "special:term" }))

hl.bind(mainMod .. " + C", hl.dsp.workspace.toggle_special("chat"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.move({ workspace = "special:chat" }))

hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("media"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:media" }))

hl.bind(mainMod .. " + minus", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.window.move({ workspace = "special:magic" }))
