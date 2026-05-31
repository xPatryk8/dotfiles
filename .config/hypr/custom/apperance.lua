hl.config({
	general = {
		border_size = 1,
		gaps_in = 2,
		gaps_out = 3,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		layout = "dwindle",
	},

	decoration = {
		rounding = 15,
		rounding_power = 3,

		active_opacity = 1.0,
		inactive_opacity = 0.8,

		shadow = {
			enabled = false,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.9,
		},
	},
	animations = {
		enabled = true,
	},
})

-- "Smart gaps" / "No gaps when only"
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})

hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.animation({ leaf = "windows", enabled = true, speed = 1.00, spring = "easy", style = "popin" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.00, bezier = "almostLinear", style = "slide" })
