local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.window_close_confirmation = "NeverPrompt"
config.initial_cols = 120
config.initial_rows = 28

config.font = wezterm.font({ family = "Iosevka" })
config.font_size = 19
config.color_scheme = "Carbonfox (Gogh)"

config.window_background_opacity = 0.55

config.enable_tab_bar = false

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.keys = {
	{
		key = "t",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

return config
