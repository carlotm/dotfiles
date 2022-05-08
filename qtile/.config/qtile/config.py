from libqtile.hook import subscribe
import os
import subprocess

from conf.settings import *
from conf.screens import screens as s
from conf.keys import keys as k
from conf.layouts import layouts as l
from conf.mouse import conf_mouse
from conf.groups import groups as g

home = os.path.expanduser("~")
mod = "mod1"
groups = g
keys = k(mod, groups)
layouts = l
screens = s
mouse = conf_mouse(mod)


@subscribe.client_focus
def send_mouse_to_focused(_):
    cmd = f"{home}/.config/qtile/send_mouse_to_focused.sh"
    subprocess.call([cmd])
