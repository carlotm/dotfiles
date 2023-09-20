local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font					= "Spleen 12"
theme.bg_normal				= "#222222"
theme.bg_focus				= "#535d6c"
theme.bg_urgent				= "#ff0000"
theme.bg_minimize			= "#444444"
theme.bg_systray			= theme.bg_normal
theme.fg_normal				= "#ffffff"
theme.fg_focus				= "#ffffff"
theme.fg_urgent				= "#ffffff"
theme.fg_minimize			= "#ffffff"
theme.useless_gap			= dpi(0)
theme.border_width			= dpi(2)
theme.border_normal			= "#222222"
theme.border_focus			= "#ff0000"
theme.wibar_bg				= "#000000"
theme.taglist_bg_focus		= "#000000"
theme.taglist_bg_urgent		= "#000000"
theme.taglist_fg_urgent		= "#ff0000"
theme.taglist_fg_empty		= "#000000"
theme.taglist_fg_occupied	= "#555555"

theme.notification_font			= "Spleen 22"
theme.notification_bg			= "#000000"
theme.notification_fg			= "#ffffff"
theme.notification_border_color	= "#ffff00"

theme.layout_max = "/home/carloratm/.config/awesome/maxw.png"
theme.layout_tile = "/home/carloratm/.config/awesome/tile.png"

theme.icon_theme = nil

return theme
