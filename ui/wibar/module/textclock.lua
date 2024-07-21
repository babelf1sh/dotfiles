local wibox = require('wibox')

return function(s)
	return wibox.widget({
	 {
		widget = wibox.container.margin
		{
		  format = '%H:%M',
        widget = wibox.widget.textclock
		},
	 }
	})
end
