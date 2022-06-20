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
g = [Group(n) for n in ["1", "2", "3", "4", "5", "6", "7", "8", "9"]]
groups = [*g, sp]
