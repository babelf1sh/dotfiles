local awful     = require('awful')
local beautiful = require('beautiful')

-- Menu
local menu = {}
local apps = require('config.apps')
local hkey_popup = require('awful.hotkeys_popup')

menu.awesome = {
	{ 'hotkeys', function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
--   { 'manual', terminal .. ' -e man awesome' },   
   { 'restart', awesome.restart },
   { 'quit', function() awesome.quit() end },
}

menu.main = awful.menu({
	items = {
			{ 'files', apps.files },
         { 'config', apps.editor_cmd .. ' ~/.config/awesome/' },
			{ 'menu', menu.awesome },
      }
})

return menu
