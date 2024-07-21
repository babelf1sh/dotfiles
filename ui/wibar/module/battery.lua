local awful = require('awful')
local wibox = require('wibox')
local battery_widget = require('battery-widget')

return function(s)
	return wibox.widget ({
       battery_widget {
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
    })

end
