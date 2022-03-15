local themes_path = require("gears.filesystem").get_themes_dir()
local rnotification = require("ruled.notification")
local dpi = require("beautiful.xresources").apply_dpi
local theme = {}


theme.useless_gap   = dpi(4)
theme.border_width  = dpi(2)
theme.border_color_normal = "#3F3F3F"
theme.border_color_active = "#6F6F6F"
theme.border_color_marked = "#CC9393"
