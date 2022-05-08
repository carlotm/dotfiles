from libqtile import bar, widget


def hi(s, color="'#555'"):
    return f"<span foreground={color}>{s}</span>"


def block(s):
    return "{}{}{}".format(hi("["), s, hi("]"))


bottom_bar = bar.Bar(
    [
        widget.GroupBox(
            highlight_method="block",
            disable_drag=True,
            active="ffffff",
            inactive="555555",
            this_current_screen_border="ff004b",
            this_screen_border="000000",
            other_current_screen_border="ff004b",
            other_screen_border="000000",
            urgent_border="000000",
            urgent_text="ff004b",
            urgent_alert_method="text",
        ),
        widget.Spacer(),
        widget.Clock(format=block("%A %d %B %H:%M")),
        widget.Wttr(location={"Vienna": "Vienna"}, format="1", fmt=block("{}")),
        widget.Spacer(),
        widget.Systray(),
        widget.KeyboardLayout(configured_keyboards=["us", "it", "de"], fmt=block("{}")),
        widget.Volume(fmt=block("VOL {}")),
        widget.Battery(format=block("BAT {percent:2.0%}")),
        widget.QuickExit(
            foreground="ff004b", default_text=block("X"), countdown_format=block("{}")
        ),
    ],
    24,
    border_width=[0, 0, 2, 0],
    border_color=["000000", "000000", "000000", "000000"],
)
