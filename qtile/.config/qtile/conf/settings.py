from libqtile.layout.floating import Floating
from libqtile.config import Match

ACCENT = "#d70000"
FG = "#ffffff"
BG = "#f6f5f4"
BG_D = "#cccccc"
W_BORDERS = {
    "border_focus": ACCENT,
    "border_normal": BG_D,
    "border_width": 2,
}

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = Floating(
    **W_BORDERS,
    float_rules=[
        *Floating.default_float_rules,
        Match(wm_class="Gcolor3"),
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = False
wl_input_rules = None
wmname = "LG3D"
widget_defaults = dict(
    font="DM Mono Medium",
    fontsize=16,
    padding=0,
)
extension_defaults = widget_defaults.copy()
