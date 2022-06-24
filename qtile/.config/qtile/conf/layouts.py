from libqtile.layout.xmonad import MonadTall
from conf.settings import W_BORDERS

layouts = [
    MonadTall(
        **W_BORDERS,
        margin=4,
        new_client_position="top",
        ratio=0.55,
        single_border_width=0,
        single_margin=0,
    ),
]
