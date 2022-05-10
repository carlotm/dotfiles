from libqtile.layout.xmonad import MonadTall
from libqtile.layout.floating import Floating

borders = {
    "border_focus": "#ff004b",
    "border_normal": "#1e1e1e",
}

layouts = [
    MonadTall(
        **borders,
        margin=20,
        new_client_position="top",
        ratio=0.55,
        single_border_width=0,
        single_margin=0,
    ),
    Floating(border_width=0),
]
