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

-- Error handling {{{
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors
	})
end
do
	local in_error = false
	awesome.connect_signal("debug::error", function (err)
		if in_error then return end
		in_error = true
		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err)
		})
		in_error = false
	end)
end
-- }}}

-- {{{ Variable definitions
beautiful.init("/home/carloratm/.config/awesome/theme.lua")
terminal = "alacritty"
launcher = "xfce4-appfinder"
laptopMonitor = "autorandr laptop-only"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod1"
awful.layout.layouts = {
	awful.layout.suit.tile.right,
	awful.layout.suit.floating,
	awful.layout.suit.max,
}
-- }}}

-- {{{ Wibar
keyboard_layout = awful.widget.keyboardlayout()
clock = wibox.widget.textclock("%H:%M %A %d %B")
battery = awful.widget.watch('bash -c \'echo "BAT: $(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percentage | cut -d ":" -f 2 | tr -d " ") "\'', 60)
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
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
	awful.key({ modkey }, "s", hotkeys_popup.show_help,
		{description="show help", group="awesome"}),
	awful.key({ modkey }, "j", function () awful.client.focus.byidx( 1) end,
		{description = "focus next by index", group = "client"}),
	awful.key({ modkey }, "k", function () awful.client.focus.byidx(-1) end,
		{description = "focus previous by index", group = "client"}),
	awful.key({ modkey, "Shift" }, "Return", function () awful.spawn(terminal) end,
		{description = "open a terminal", group = "launcher"}),
	awful.key({ modkey }, "F2", function () awful.spawn(launcher) end,
		{description = "open an application launcher", group = "launcher"}),
	awful.key({ modkey, "Control" }, "r", awesome.restart,
		{description = "reload awesome", group = "awesome"}),
	awful.key({ modkey }, "l", function () awful.tag.incmwfact( 0.05) end,
		{description = "increase master width factor", group = "layout"}),
	awful.key({ modkey }, "h", function () awful.tag.incmwfact(-0.05) end,
		{description = "decrease master width factor", group = "layout"}),
	awful.key({ modkey, }, "space", function () awful.layout.inc(1) end,
		{description = "select next", group = "layout"}),
	awful.key({ }, "XF86WakeUp", function () awful.spawn(laptopMonitor) end,
		{description = "activate laptop monitor", group = "layout"})
)

clientkeys = gears.table.join(
	awful.key({ modkey }, "f",
		function (c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{description = "toggle fullscreen", group = "client"}),
	awful.key({ modkey, "Shift" }, "c", function (c) c:kill() end,
		{description = "close", group = "client"}),
	awful.key({ modkey, "Shift" }, "t", awful.client.floating.toggle,
		{description = "toggle floating", group = "client"}),
	awful.key({ modkey }, "Return", function (c) c:swap(awful.client.getmaster()) end,
		{description = "move to master", group = "client"})
)

for i = 1, 9 do
	globalkeys = gears.table.join(globalkeys,
		awful.key({ modkey }, "#" .. i + 9,
			function ()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					tag:view_only()
				end
			end,
			{description = "view tag #"..i, group = "tag"}),
		awful.key({ modkey, "Shift" }, "#" .. i + 9,
			function ()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
			{description = "move focused client to tag #"..i, group = "tag"})
	)
end

clientbuttons = gears.table.join(
	awful.button({ }, 1, function (c)
		c:emit_signal("request::activate", "mouse_click", {raise = true})
	end),
	awful.button({ modkey }, 1, function (c)
		c:emit_signal("request::activate", "mouse_click", {raise = true})
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function (c)
		c:emit_signal("request::activate", "mouse_click", {raise = true})
		awful.mouse.client.resize(c)
	end)
)

root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
	{
		rule = { },
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap+awful.placement.no_offscreen
		}
	}, {
		rule_any = {
			instance = {
				-- "pinentry",
			},
			class = {
				"Gcolor3",
			},
			role = {
				"pop-up",
			}
		},
		properties = { floating = true }
	}, {
		rule_any = {
			type = { "normal", "dialog" }
		},
		properties = { titlebars_enabled = false }
	},
}
-- }}}

-- {{{ Signals
screen.connect_signal("arrange", function (s)
	local only_one = #s.tiled_clients == 1
	for _, c in pairs(s.clients) do
		if only_one and not c.floating or c.maximized then
			c.border_width = 0
		else
			c.border_width = beautiful.border_width
		end
	end
end)
client.connect_signal("manage", function (c)
	if awesome.startup
	and not c.size_hints.user_position
	and not c.size_hints.program_position
	then
		awful.placement.no_offscreen(c)
	end
end)
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
