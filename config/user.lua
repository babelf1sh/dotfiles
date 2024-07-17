local awful = require('awful')

return {

	mod = 'Mod4',

	layouts = {
		awful.layout.suit.tile,
		awful.layout.suit.max,
		awful.layout.suit.tile.top,
	},

}
