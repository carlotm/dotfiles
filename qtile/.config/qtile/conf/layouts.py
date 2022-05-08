from libqtile.layout.xmonad import MonadTall

layouts = [
    MonadTall(
        border_focus="#ff004b",
        border_normal="#1e1e1e",
        border_width=4,
        margin=20,
        new_client_position="top",
        ratio=0.55,
        single_border_width=0,
        single_margin=0,
    ),
]
