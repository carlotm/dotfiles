from libqtile.config import Screen
from .bars import bottom_bar


screens = [
    Screen(top=bottom_bar),
]
