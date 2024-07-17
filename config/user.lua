local awful = require('awful')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi
local gears = require('gears')

local walls = gears.filesystem.get_configuration_dir() .. 'theme/walls/'

return {

	mod = 'Mod4',

	layouts = {
		awful.layout.suit.tile,
		awful.layout.suit.max,
		awful.layout.suit.tile.top,
	},

	wallpaper = walls .. 'indigo_hydrangeas.jpg',
}
