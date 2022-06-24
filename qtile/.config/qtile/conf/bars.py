from libqtile import bar, widget
from conf.settings import COLORS


bottom_bar = bar.Bar(
    [
        widget.AGroupBox(),
        widget.Spacer(),
        widget.Clock(format="%A %d %B %H:%M", foreground=COLORS[0]),
        widget.Spacer(),
        widget.Systray(),
        widget.KeyboardLayout(
            configured_keyboards=["us", "it", "de"], foreground=COLORS[0], fmt="{} "
        ),
        widget.Volume(fmt=" VOL {} ", foreground=COLORS[0]),
        widget.Battery(format=" BAT {percent:2.0%}  "),
        widget.Wttr(location={"Vienna": "Vienna"}, format="1", foreground=COLORS[0]),
    ],
    24,
    margin=[0, 0, 0, 0],
    padding=[0, 0, 0, 0],
    background=COLORS[1],
)
