--[[

     Powerarrow Dark Awesome WM theme
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
local logout_menu_widget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
-- local net_speed_widget = require("awesome-wm-widgets.net-speed-widget.net-speed")

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark"
theme.wallpaper                                 = "/home/pedro/Images/wallhaven-ymjrzx_1920x1080.png"
theme.font                                      = "Iosevka 11"
theme.fg_normal                                 = "#DDDDFF"
theme.fg_focus                                 = "dark cyan"
-- theme.fg_normal                                  = "#7aa2f7"
theme.fg_urgent                                 = "#9d7cd8"
-- theme.bg_normal                                 = "#1f2335"
theme.bg_normal                                 = "#161320"
theme.bg_focus                                  = "#414b68"
theme.bg_urgent                                 = "#9d7cd8"
theme.border_width                              = dpi(2)
theme.border_normal                             = "#394b70"
theme.border_focus                              = "#7aa2f7"
theme.border_marked                             = "#CC9393"
-- theme.tasklist_bg_focus                         = "#1f2335"
theme.tasklist_bg_focus                         = theme.bg_focus
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
-- theme.layout_tile                               = theme.dir .. "/icons/tile.png"
-- theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
-- theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
-- theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
-- theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
-- theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
-- theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
-- theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
-- theme.layout_max                                = theme.dir .. "/icons/max.png"
-- theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
-- theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
-- theme.layout_floating                           = theme.dir .. "/icons/floating.png"
-- theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
-- theme.widget_battery                            = theme.dir .. "/icons/battery.png"
-- theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
-- theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/ram_blue.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu_blue.png"
-- theme.widget_temp                               = theme.dir .. "/icons/temp.png"
-- theme.widget_net                                = theme.dir .. "/icons/net.png"
-- theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note_blue.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_blue.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
-- theme.widget_mail                               = theme.dir .. "/icons/mail.png"
-- theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.tasklist_plain_task_name                  = false
theme.tasklist_disable_icon                     = false
theme.tasklist_disable_task_name                = true
theme.tasklist_align                            = "left"
theme.useless_gap                               = dpi(2)
-- theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
-- theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
-- theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
-- theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
-- theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
-- theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
-- theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
-- theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
-- theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
-- theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
-- theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
-- theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
-- theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
-- theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
-- theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
-- theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
-- theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
-- theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

local markup = lain.util.markup
local separators = lain.util.separators

-- local keyboardlayout = awful.widget.keyboardlayout:new()

-- Textclock
-- local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
    "date +'%a %d %b %R'", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
    end
)

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = "Terminus 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- MPD
local musicplr = awful.util.terminal .. " -title Music -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(theme.widget_music)
mpdicon:buttons(my_table.join(
    awful.button({ "Mod4" }, 1, function () awful.spawn(musicplr) end),
    awful.button({ }, 1, function ()
        os.execute("mpc prev")
        theme.mpd.update()
    end),
    awful.button({ }, 2, function ()
        os.execute("mpc toggle")
        theme.mpd.update()
    end),
    awful.button({ }, 3, function ()
        os.execute("mpc next")
        theme.mpd.update()
    end)))
theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            mpdicon:set_image(theme.widget_music_on)
        elseif mpd_now.state == "pause" then
            artist = " mpd "
            title  = "paused "
        else
            artist = ""
            title  = ""
            mpdicon:set_image(theme.widget_music)
        end

        -- widget:set_markup(markup.font(theme.font, markup("#7aa2f7", artist) .. title))
        widget:set_markup(markup.font(theme.font, markup(theme.fg_focus, artist) .. title))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. string.format("%.0f",mem_now.used/4096*100) .. "% "))
    end
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
    end
})

-- Separators
-- set_markup(markup.font(theme.font, markup(theme.fg_focus, artist) .. title))
local spr     = wibox.widget.textbox(' ')
-- local spr     = wibox.widget.textbox(markup(theme.fg_focus, '|'))
local arrl_dl = separators.arrow_left(theme.bg_focus, "alpha")
local arrl_ld = separators.arrow_left("alpha", theme.bg_focus)

function theme.at_screen_connect(s)
    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.suit.tile)
    awful.tag.add("", {
	layout = awful.layout.suit.tile,
	-- master_fill_policy = "master_width_factor",
	screen = s,
	master_width_factor = 0.8,
	gap = 0
	})

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(18), bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        -- expand = 'none',
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- spr,
            s.mytaglist,
            s.mypromptbox,
            spr,
        },
        { -- Middle widget
        layout = wibox.layout.fixed.horizontal,
        s.mytasklist,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            spr,
            mpdicon,
            theme.mpd.widget,
            spr,
            volume_widget{
                main_color = theme.fg_focus,
                widget_type = 'arc'
            },
            spr,
            memicon,
            mem.widget,
            cpuicon,
            cpu.widget,
            -- net_speed_widget(),
            clock,
            spr,
	    logout_menu_widget(),
            -- s.mylayoutbox,
        },
    }
end

return theme
