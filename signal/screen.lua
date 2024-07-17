local awful     = require('awful')
local beautiful = require('beautiful')
local wibox     = require('wibox')
local gears 	 = require("gears")

local widgets   = require('ui')

screen.connect_signal("request::desktop_decoration", function(s)

	-- tags & layouts
	 awful.tag.add("1",{
		  screen = s,
		  layout = awful.layout.suit.tile,
		  selected = true,
	 })
	 awful.tag.add("2",{
		  screen = s,
		  layout = awful.layout.suit.max,
	 })
	 awful.tag.add("3",{
		  screen = s,
	--	  layout = awful.layout.suit.tile,
	 })
	 awful.tag.add("4",{
		  screen = s,
	--	  layout = awful.layout.suit.tile,
	 })
	 awful.tag.add("5",{
		  screen = s,
	--	  layout = awful.layout.suit.tile,
	 })

  -- wibar
	widgets.wibar(s)

end) 

-- {{{ Wallpaper
screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper {
        screen = s,
        widget = {
            {
                image     = beautiful.wallpaper,
                upscale   = true,
                downscale = true,
                widget    = wibox.widget.imagebox,
            },
            valign = "center",
            halign = "center",
            tiled  = false,
            widget = wibox.container.tile,
        }
    }
end)
-- }}}
