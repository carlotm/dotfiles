from libqtile import bar, widget
from conf.settings import ACCENT, BG, FG


bottom_bar = bar.Bar(
    [
        widget.GroupBox(
            highlight_method="text",
            disable_drag=True,
            rounded=False,
            active="#999999",
            inactive="#333333",
            this_current_screen_border="#ffffff",
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
        widget.KeyboardLayout(configured_keyboards=["us", "it", "de"], foreground=FG, fmt="{} "),
        widget.Volume(fmt=" VOL {} ", foreground=FG),
        widget.Wttr(location={"Vienna": "Vienna"}, format="1", fmt="{}", foreground=FG),
    ],
    24,
    margin=[0, 0, 0, 0],
    border_width=[0, 1, 0, 0],
    border_color=["#000000", "#000000", "#000000", "#000000"],
    background="#000000",
)
