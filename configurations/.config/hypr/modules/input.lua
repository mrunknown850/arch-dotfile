--#####################
-- PERIPHEPAL CONTROL #
--#####################

hl.device({
	name = "tpps/2-elan-trackpoint",
	sensitivity = 0.21,
	accel_profile = "adaptive",
})

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_options = "caps:escape",
		kb_model = "",
		kb_rules = "",
		follow_mouse = 2,
		sensitivity = 0.15,
		accel_profile = "adaptive",
		touchpad = {
			disable_while_typing = false,
			natural_scroll = true,
			-- scroll_factor = 0.7
		},
	},
})
