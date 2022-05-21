from libqtile.layout.xmonad import MonadTall
from libqtile.layout.floating import Floating
from conf.settings import ACCENT

borders = {
    "border_focus": ACCENT,
    "border_normal": "#1e1e1e",
    "border_width": 4,
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
    Floating(**borders),
]
