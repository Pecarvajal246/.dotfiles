# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os
import subprocess

from libqtile import hook

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/autostart.sh')
    subprocess.run([home])

@hook.subscribe.client_new
def mpv(c):
    if "mpv" in c.name:
        c.togroup("5", switch_group=True)

local_bin = os.path.expanduser("~") + "/.local/bin"
if local_bin not in os.environ["PATH"]:
    os.environ["PATH"] = "{}:{}".format(local_bin, os.environ["PATH"])

mod = "mod4"
terminal = "kitty"

colors = [
    ["#D9E0EE", "#D9E0EE"],  # foreground
    ["#161320", "#161320"],  # background
    ["#3b4252", "#3b4252"],  # background lighter
    ["#F28FAD", "#F28FAD"],  # red
    ["#ABE9B3", "#ABE9B3"],  # green
    ["#FAE3B0", "#FAE3B0"],  # yellow
    ["#96CDFB", "#96CDFB"],  # blue
    ["#DDB6F2", "#DDB6F2"],  # magenta
    ["#89DCEB", "#89DCEB"],  # cyan
    ["#C3BAC6", "#C3BAC6"],  # white
    ["#6E6C7E", "#6E6C7E"],  # grey
    ["#F8BD96", "#F8BD96"],  # orange
    ["#96CDFB", "#96CDFB"],  # super cyan
    ["#5e81ac", "#5e81ac"],  # super blue
    ["#242831", "#242831"],  # super dark background
]


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "Tab", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "d", lazy.layout.decrease_ratio(), desc="Grow window to the left"),
    Key([mod, "control"], "h", lazy.layout.shrink(), desc="Grow window to the left"),
    Key([mod, "control"], "i", lazy.layout.increase_ratio(), desc="Grow window to the right"),
    Key([mod, "control"], "l", lazy.layout.grow(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Fullscreen window"),
    Key([mod], "m", lazy.window.toggle_maximize(), desc="Maximize window"),
    Key([mod, "control"], "n", lazy.window.toggle_minimize(), desc="Reset all window sizes"),
    Key([mod, "control"], "space", lazy.window.toggle_floating(), desc="Toggle floating window"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Audio
    # Key([], "XF86AudioRaiseVolume",lazy.spawn("amixer set Master 3%+")),
    # Key([], "XF86AudioLowerVolume",lazy.spawn("amixer set Master 3%-")),
    # Key([], "XF86AudioMute",lazy.spawn("amixer set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer --decrease 5")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer --increase 5")),
    Key([], "XF86AudioMute", lazy.spawn("pamixer --toggle-mute")),

    # MPD
    Key([], "XF86AudioPlay", lazy.spawn("mpc toggle"), desc="Play/Pause MPD"),
    Key([], "XF86AudioPrev", lazy.spawn("mpc prev"), desc="MPD previous song"),
    Key([], "XF86AudioNext", lazy.spawn("mpc next"), desc="MPD next song"),

    # Programs
    Key([mod], "p", lazy.spawn("rofi -show run"), desc="Spawn rofi run"),
    Key([mod], "e", lazy.spawn("thunar"), desc="Spawn thunar"),
    Key([mod], "b", lazy.spawn("brave --enable-features=VaapiVideoDecoder"), desc="open brave"),
    Key([mod], "y", lazy.spawn('streams.sh')),
    Key([mod, "mod1" ], "m", lazy.group['scratchpad'].dropdown_toggle('ncmpcpp')),

]
layout_theme = {
        "border_width":2,
        "margin":4,
        "border_focus":colors[6],
        "border_normal":colors[2]
        }
layouts = [
    layout.MonadTall(**layout_theme, single_border_width=0, single_margin=0),
    layout.Max(),
    # layout.Tile(**layout_theme),

    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

# groups = [Group(i) for i in "123456789"]
groups = [

        Group("1"),
        Group("2"),
        Group("3"),
        Group("4"),
        Group("5", matches = [Match(wm_class=["mpv", "chatterino"])], layouts=[layout.Tile(ratio=0.8, master_match=Match(wm_class="mpv"), border_focus=colors[6])])
        ]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
groups.append(ScratchPad("scratchpad", [
        DropDown("ncmpcpp", "kitty -e ncmpcpp", height=0.8, opacity=1)]),
        )

group_box_settings = {
    "padding": 3,
    "borderwidth": 4,
    "active": colors[9],
    "inactive": colors[10],
    "disable_drag": True,
    "rounded": True,
    "highlight_color": colors[2],
    "block_highlight_text_color": colors[6],
    "highlight_method": "block",
    "this_current_screen_border": colors[2],
    "this_screen_border": colors[7],
    "other_current_screen_border": colors[1],
    "other_screen_border": colors[1],
    "foreground": colors[0],
    "background": colors[1],
    "urgent_border": colors[3],
}

widget_defaults = dict(
    # font="CaskaydiaCove Nerd Font",
    # font="Iosevka Nerd Font",
    font="Iosevka",
    # font="Iosevka Extended",
    fontsize=14,
    padding=3,
    background=colors[1],
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(**group_box_settings),
                widget.Spacer(),
                # widget.TaskList(highlight_method='block', border=colors[13]),
                widget.Mpd2(status_format='{play_status} {artist} - {title}'),
                widget.Spacer(),
                widget.CPU(
                    format=' {load_percent}%'
                ),
                widget.Sep(
                    linewidth=0,
                    padding=10,
                    size_percent=50,
                    background=colors[1],
                ),
                widget.TextBox(
                    text="",
                    ),
                widget.ThermalSensor(threshold=220),
                widget.Sep(
                    linewidth=0,
                    padding=10,
                    size_percent=50,
                    background=colors[1],
                ),
                widget.TextBox(
                    text="",
                    ),
                widget.PulseVolume(
                    update_interval=0.1,
                    get_volume_command='pamixer --get-volume',
                    ),
                widget.Sep(
                    linewidth=0,
                    padding=10,
                    size_percent=50,
                    background=colors[1],
                ),
                widget.Systray(),
                widget.TextBox(
                    text="",
                    ),
                widget.Clock(format="%a %d/%m/%y"),
                widget.Sep(
                    linewidth=0,
                    padding=10,
                    size_percent=50,
                    background=colors[1],
                ),
                widget.TextBox(
                    text="",
                    ),
                widget.Clock(format="%H:%M:%S"),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
