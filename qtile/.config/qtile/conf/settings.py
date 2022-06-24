from libqtile.layout.floating import Floating
from libqtile.config import Match

COLORS = ["#ffffff", "#000000", "#1458EC", "#AAAAAA", "#2d45b0", "#f5f5f5", "#444444"]
FONT = "Misc Ohsnap"


W_BORDERS = {
    "border_focus": COLORS[4],
    "border_normal": COLORS[3],
    "border_width": 4,
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
    font=FONT,
    fontsize=16,
    padding=0,
)
extension_defaults = widget_defaults.copy()
