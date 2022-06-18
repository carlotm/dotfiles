from libqtile.config import Group, ScratchPad, DropDown


sp = ScratchPad(
    "scratchpad",
    [
        DropDown(
            "term",
            "alacritty",
            x=0.05,
            y=0,
            width=0.9,
            height=0.9,
            on_focus_lost_hide=True,
        )
    ],
)
g = [
    Group(n, label="■")
    for n in ["www", "dev", "terms", "gfx", "mus", "pass", "misc", "irc", "chat"]
]
groups = [*g, sp]
