local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}
theme.font          = "Spleen 22"
theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal
theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"
theme.useless_gap   = dpi(0)
theme.border_width  = dpi(2)
theme.border_normal = "#222222"
theme.border_focus  = "#ff0000"
theme.border_marked = "#ffff00"
theme.icon_theme = nil
return theme
