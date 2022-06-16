from libqtile.config import Group


groups = [Group(f"{n}{i}", label="❖") for n, i in enumerate(["a", "b", "c", "d"])]
