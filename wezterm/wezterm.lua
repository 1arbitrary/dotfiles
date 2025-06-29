local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular", italic = false })
config.font_size = 14.0
config.enable_tab_bar = false
config.window_background_opacity = 0.6
config.window_padding = {
	left = 0,
	right = 0,
	top = 5,
	bottom = 0,
}

config.colors = {
	foreground = "#FF1010", -- Green
	background = "#000000", -- Black
}

return config
