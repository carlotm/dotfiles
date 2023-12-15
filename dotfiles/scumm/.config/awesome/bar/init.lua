pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

keyboard_layout = awful.widget.keyboardlayout()
clock = wibox.widget.textclock("%H:%M %A %d %B")
awful.screen.connect_for_each_screen(function(s)
  awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    layout  = {
      layout  = wibox.layout.fixed.horizontal,
      spacing = 10
    },
  }
  s.mywibox = awful.wibar({ position = "top", screen = s })
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    expand = "none",
    {
      layout = wibox.layout.fixed.horizontal,
      spacing = 10,
      s.mytaglist,
    },
    clock,
    {
      layout = wibox.layout.fixed.horizontal,
      battery,
      keyboard_layout,
      wibox.widget.systray(),
      s.mylayoutbox
    }
}
end)
