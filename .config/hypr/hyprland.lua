MAIN_MOD = "SUPER"
TERMINAL = "wezterm"
FILE_MANAGER = TERMINAL .. " -e yazi"
MENU = "rofi -modi drun,calc -show"

require("custom.keybinds")
require("custom.apperance")
require("custom.autostart")

---- MONITORS ----
hl.monitor({
	output = "",
	mode = "1920x1080@60",
	position = "auto",
	scale = "1",
})

---- ENVIRONMENT VARIABLES ----
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("GTK_THEME", "prefer-dark")
hl.env("QT_QPA_PLATFORMTHEME", "kde")

---- INPUT ----
hl.config({
	input = {
		kb_layout = "pl",
		kb_variant = "",
		kb_model = "pc105",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0,

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

---- WINDOWS AND WORKSPACES ----
hl.window_rule({
	-- Ignore maximize requests from all apps
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
