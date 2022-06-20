from libqtile.config import Key
from libqtile.lazy import lazy
from conf.settings import ACCENT, BG, FG


def keys(mod, groups):
    menu_cmd = [
        "dmenu_run",
        "-l",
        "10",
        "-fn",
        "DM Mono Medium:weight=medium:size=36",
        "-nb",
        "#000000",
        "-nf",
        FG,
        "-sb",
        ACCENT,
    ]
    keys = [
        Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
        Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
        Key([mod, "shift"], "Return", lazy.spawn("alacritty"), desc="Launch terminal"),
        Key([mod], "F2", lazy.spawn(menu_cmd), desc="Launch application launcher"),
        Key([mod], "Tab", lazy.layout.next(), desc="Move focus to next"),
        Key([mod], "j", lazy.layout.next(), desc="Move focus to next"),
        Key([mod], "k", lazy.layout.next(), desc="Move focus to next"),
        Key([mod], "l", lazy.layout.grow(), desc="Grow window"),
        Key([mod], "h", lazy.layout.shrink(), desc="Shrink window"),
        Key([mod], "t", lazy.window.toggle_floating(), desc="Reset floating"),
        Key([mod], "Return", lazy.layout.swap_left(), desc="Move client to left"),
        Key([mod, "shift"], "h", lazy.layout.swap_left(), desc="Move client to left"),
        Key([mod, "shift"], "l", lazy.layout.swap_right(), desc="Move client to right"),
        Key([mod, "shift"], "f", lazy.window.toggle_fullscreen()),
        Key([], "F12", lazy.group["scratchpad"].dropdown_toggle("term")),
        Key(
            [mod],
            "space",
            lazy.widget["keyboardlayout"].next_keyboard(),
            desc="Next keyboard layout.",
        ),
    ]

    for i, g in enumerate(groups):
        if i >= 9:
            break

        group_key = "{}".format(i + 1)
        group_keys = [
            Key(
                [mod],
                group_key,
                lazy.group[g.name].toscreen(),
                desc=f"show group {g.name}",
            ),
            Key(
                [mod, "shift"],
                group_key,
                lazy.window.togroup(g.name),
                desc=f"move focused window to group {g.name}",
            ),
        ]
        keys.extend(group_keys)

    return keys
