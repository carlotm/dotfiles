config.load_autoconfig(False)
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

c.fonts.default_family = ['Open Sans']
c.fonts.default_size = '18pt'
c.fonts.tabs.selected = 'Open Sans Semibold 9pt'
c.fonts.tabs.unselected = 'Open Sans Semibold 9pt'
c.fonts.web.family.sans_serif = 'Open Sans'
c.fonts.contextmenu = '18pt Open Sans'
c.statusbar.show = 'in-mode'
c.statusbar.widgets = ['keypress']
c.tabs.show = 'multiple'
c.tabs.indicator.width = 0
c.tabs.title.format = '{current_title}'
c.zoom.default = '140%'
c.input.insert_mode.auto_enter = True

c.colors.tabs.even.bg = '#b8b5b2'
c.colors.tabs.even.fg = '#888888'
c.colors.tabs.odd.bg = '#b8b5b2'
c.colors.tabs.odd.fg = '#888888'
c.colors.tabs.indicator.error = '#ff0000'
c.colors.tabs.indicator.start = '#0000aa'
c.colors.tabs.indicator.stop = '#00aa00'
c.colors.tabs.indicator.system = 'rgb'
c.colors.tabs.selected.even.bg = '#d8d5d2'
c.colors.tabs.selected.even.fg = 'black'
c.colors.tabs.selected.odd.bg = '#d8d5d2'
c.colors.tabs.selected.odd.fg = 'black'
c.colors.tabs.pinned.even.bg = '#404040'
c.colors.tabs.pinned.even.fg = '#cccccc'
c.colors.tabs.pinned.odd.bg = '#404040'
c.colors.tabs.pinned.odd.fg = '#cccccc'
c.colors.tabs.pinned.selected.even.bg = 'black'
c.colors.tabs.pinned.selected.even.fg = 'white'
c.colors.tabs.pinned.selected.odd.bg = 'black'
c.colors.tabs.pinned.selected.odd.fg = 'white'

config.bind('<Ctrl-Tab>', 'tab-next')
config.unbind('<Alt-1>')
config.unbind('<Alt-2>')
config.unbind('<Alt-3>')
config.unbind('<Alt-4>')
config.unbind('<Alt-5>')
config.unbind('<Alt-6>')
config.unbind('<Alt-7>')
config.unbind('<Alt-8>')
config.unbind('<Alt-9>')
