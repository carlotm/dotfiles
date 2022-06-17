from libqtile import bar, widget
from conf.settings import ACCENT, BLACK


def hi(s, color="'#555'"):
    return f"<span foreground={color}>{s}</span>"


def block(s):
    return "{}{}{}".format(hi(" "), s, hi(" "))


bottom_bar = bar.Bar(
    [
        widget.GroupBox(
            highlight_method="text",
            disable_drag=True,
            active="ffffff",
            inactive="333333",
            this_current_screen_border=ACCENT,
            this_screen_border=BLACK,
            other_current_screen_border=ACCENT,
            other_screen_border=BLACK,
            urgent_border=BLACK,
            urgent_text=ACCENT,
            urgent_alert_method="text",
        ),
        widget.Spacer(),
        widget.Clock(format=block("%A %d %B %H:%M")),
        widget.Spacer(),
        widget.Systray(),
        widget.KeyboardLayout(configured_keyboards=["us", "it", "de"], fmt=block("{}")),
        widget.Volume(fmt=block("VOL {}")),
        widget.Battery(format=block("BAT {percent:2.0%}")),
        widget.Wttr(location={"Vienna": "Vienna"}, format="1", fmt=block("{}")),
    ],
    24,
    border_width=[0, 1, 0, 0],
    border_color=[BLACK, BLACK, BLACK, BLACK],
    background=BLACK,
)
