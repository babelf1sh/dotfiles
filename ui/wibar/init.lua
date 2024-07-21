local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

local module = require(... .. '.module')
local battery_widget = require('battery-widget')

return function(s)
  
	-- textclock widget
    s.my_textclock = wibox.widget {
        format = '%H:%M',
        widget = wibox.widget.textclock
    } 

     s.left_bar = wibox {
		  visible = true,
		  screen = s,
		  x = 5,
		  y = 5,
		  width = dpi(150),
		  height = dpi(30),
		  widget = {
			  layout = wibox.layout.align.horizontal,
			  {
				layout = wibox.container.margin,
            left = 10,
            module.taglist(s),
		  	  },
		  }
	  }

 
	  s.center_bar = wibox {
		  visible = true,
		  screen = s,
		  x = 1060,
		  y = 5,
		  width = dpi(70),
		  height = dpi(30),
		  widget = {
			  layout = wibox.layout.align.horizontal,
			  {
				layout = wibox.container.margin,
            left = 10,
            s.my_textclock
				--module.textclock()
		  	  },
		  }
	  }

	  s.right_bar = wibox {
		  visible = true,
		  screen = s,
		  x = 2165,
		  y = 5,
		  width = dpi(45),
		  height = dpi(30),
		  widget = {
			  layout = wibox.layout.align.horizontal,
			  {
				layout = wibox.container.margin,
            left = 10,
				--awful.widget.keyboardlayout,
				--module.battery(),
				battery_widget{
                ac = 'ACAD',
                adapter = 'BAT1',
                ac_prefix = '',
                battery_prefix = '',
                percent_colors = {
                    { 25, '#904e55'   },
                    { 50, '#F0C674'   },
                    { 999, '#cac3bb'  },
                },
                listen = true,
                timeout = 10,
                widget_text = '${color_on}${percent}%${color_off}',
                tooltip_text = 'battery ${state}${time_est}',
                alert_threshold = 5,
                alert_timeout = 0,
                alert_title = 'low battery !',
                alert_text = '${AC_BAT}${time_est}',
                alert_icon = '~/.config/awesome/battery-widget/icons/dead.png',
                warn_full_battery = true,
                full_battery_icon = '~/.config/awesome/battery-widget/icons/full-charged.png',
            },
		  	  },
		  }
	  }
 
	  s.left_bar:struts({
	 	  top = dpi(35),
		  bottom = dpi(0),
		  left = dpi(0),
		  right = dpi(0)
 	  })

end
