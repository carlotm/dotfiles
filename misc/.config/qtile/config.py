from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.lazy import lazy
from libqtile import layout, bar, widget

from typing import List  # noqa: F401

mod = "mod1"

dmenu_cmd = "dmenu_run -fn {} -nb {} -sb {} -nf {} -sf {}".format(
    "InputMonoCondensed:size=42",
    "'#000000'",
    "'#000000'",
    "'#666666'",
    "'#ffffff'",
)

keys = [
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "j", lazy.layout.up()),
    Key([mod], "h", lazy.layout.shrink()),
    Key([mod], "l", lazy.layout.grow()),
    Key([mod], "Return", lazy.layout.swap_left()),
    Key([mod, "shift"], "c", lazy.window.kill()),

    Key([], "F1", lazy.spawn("kitty")),
    Key([], "F2", lazy.spawn(dmenu_cmd)),

    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])

layouts = [
    layout.MonadTall(
        border_focus="#FF0044",
        border_normal="#2E3B50",
        border_width=2,
        ratio=0.55,
    ),
    layout.Floating(
        border_focus='#ff0044',
        border_normal="#2E3B50",
    ),
]

widget_defaults = dict(
    font='InputMonoCondensed',
    fontsize=16,
    padding=0,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    active='#888888',
                    borderwidth=2,
                    disable_drag=True,
                    highlight_method='text',
                    this_current_screen_border='#ffffff',
                    font='InputMonoCondensed',
                    spacing=10,
                    rounded=False,
                ),
                widget.Spacer(20),
                widget.WindowName(),
                widget.Systray(),
                widget.Volume(
                    emoji=False,
                ),
                widget.Spacer(20),
                widget.Battery(
                    format='{char}{percent:2.0%}',
                    discharge_char='↓',
                    charge_char='↑',
                ),
                widget.Spacer(20),
                widget.Clock(format='%a %d/%m/%Y %I:%M'),
            ],
            24,
            background="#000000",
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
    {'wmclass': 'gcolor2'},
])
auto_fullscreen = True
focus_on_window_activation = "smart"
wmname = "LG3D"
