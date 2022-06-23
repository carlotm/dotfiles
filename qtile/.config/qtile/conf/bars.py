from libqtile import bar, widget
from conf.settings import COLORS


bottom_bar = bar.Bar(
    [
        widget.GroupBox(
            font="Terminus (TTF)",
            disable_drag=True,
            rounded=False,
            highlight_method="line",
            hide_unused=True,
            padding_x=4,
            active=COLORS[0],
            inactive=COLORS[3],
            highlight_color=[COLORS[1], COLORS[6]],
            this_current_screen_border=COLORS[2],
        ),
        widget.Spacer(),
        widget.Clock(format="%A %d %B %H:%M", foreground=COLORS[0]),
        widget.Spacer(),
        widget.Systray(),
        widget.KeyboardLayout(
            configured_keyboards=["us", "it", "de"], foreground=COLORS[0], fmt="{} "
        ),
        widget.Volume(fmt=" VOL {} ", foreground=COLORS[0]),
        widget.Wttr(location={"Vienna": "Vienna"}, format="1", foreground=COLORS[0]),
    ],
    24,
    margin=[0, 0, 0, 0],
    background=COLORS[1],
)
