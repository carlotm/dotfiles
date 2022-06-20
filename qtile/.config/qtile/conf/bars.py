from libqtile import bar, widget
from conf.settings import ACCENT, BG, BG_D, FG


bottom_bar = bar.Bar(
    [
        widget.GroupBox(
            highlight_method="text",
            disable_drag=True,
            rounded=False,
            active="#AAAAAA",
            inactive="#AAAAAA",
            this_current_screen_border=ACCENT,
            this_screen_border=BG,
            other_current_screen_border=ACCENT,
            other_screen_border=BG,
            urgent_border=BG,
            urgent_text=ACCENT,
            urgent_alert_method="text",
        ),
        widget.Spacer(),
        widget.Clock(format="%A %d %B %H:%M", foreground=FG),
        widget.Spacer(),
        widget.Systray(),
        widget.KeyboardLayout(configured_keyboards=["us", "it", "de"], foreground=FG),
        widget.Volume(fmt=" VOL {} ", foreground=FG),
        widget.Wttr(location={"Vienna": "Vienna"}, format="1", fmt="{}", foreground=FG),
    ],
    24,
    margin=[0, 0, 0, 0],
    border_width=[0, 1, 0, 0],
    border_color=[BG, BG, BG, BG],
    background=BG,
)
