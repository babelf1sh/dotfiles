local awful = require('awful')
local wibox = require('wibox')

local module = require(... .. '.module')
local battery_widget = require("battery-widget")

return function(s)
   
	 -- promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

	 -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    } 

	 -- textclock widget
    s.my_textclock = wibox.widget {
        format = '%H:%M',
        widget = wibox.widget.textclock
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ 
        position = 'top',
        stretch = true,
        -- width = 150,
        margins = 5,
        align = align,
        restrict_workarea = true,
        screen = s, 
		  widget = {
			  layout = wibox.layout.align.horizontal,
			  -- left widget
		  {
				layout = wibox.container.margin,
            left = 10,
            s.mytaglist,
		  },
		  	  -- middle widget
		  {
				layout = wibox.container.place,   
            halign = "center",
            s.my_textclock,
		  },
			 --[[ battery widget
		  {
				layout = wibox.container.margin,
            right = 10,
            battery_widget{
                ac = "ACAD",
                adapter = "BAT1",
                ac_prefix = "",
                battery_prefix = "",
                percent_colors = {
                    { 25, "#904e55"   },
                    { 50, "#F0C674"   },
                    { 999, "#cac3bb"  },
                },
                listen = true,
                timeout = 10,
                widget_text = "${color_on}${percent}%${color_off}",
                tooltip_text = "battery ${state}${time_est}",
                alert_threshold = 5,
                alert_timeout = 0,
                alert_title = "low battery !",
                alert_text = "${AC_BAT}${time_est}",
                alert_icon = "~/.config/awesome/battery-widget/icons/dead.png",
                warn_full_battery = true,
                full_battery_icon = "~/.config/awesome/battery-widget/icons/full-charged.png",
            }, 
		  },]]
	  }
  })
end
