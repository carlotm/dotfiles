from conf.settings import *
from conf.screens import screens as s
from conf.keys import keys as k
from conf.layouts import layouts as l
from conf.mouse import conf_mouse
from conf.groups import groups as g

mod = "mod1"
groups = g
keys = k(mod, groups)
layouts = l
screens = s
mouse = conf_mouse(mod)
