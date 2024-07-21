local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local mod = require('binds.mod')
local modkey = mod.modkey

-- layout popup menu
local ll = awful.widget.layoutlist {
    base_layout = wibox.widget {
        spacing         = 10,
        forced_num_cols = 2,
        layout          = wibox.layout.grid.horizontal,
    },
    widget_template = {
        {
            {
                id            = 'icon_role',
                forced_height = dpi(5),
                forced_width  = dpi(5),
                widget        = wibox.widget.imagebox,
            },
            margins = 5,
            widget  = wibox.container.margin,
        },
        id              = 'background_role',
        forced_width    = dpi(40),
        forced_height   = dpi(40),
		  shape           = gears.shape.rounded_rect,
        widget          = wibox.container.background,
    },
}

local layout_popup = awful.popup {
    widget = wibox.widget {
        ll,
        margins = 10,
        widget  = wibox.container.margin,
    },
	 border_color = beautiful.popup_border_color,
    border_width = beautiful.popup_border_width,
    placement    = awful.placement.centered,
    ontop        = true,
    visible      = false,
    shape = function(cr, w, h)
       gears.shape.rounded_rect(cr, w, h, 3)
    end
}

awful.keygrabber {
    start_callback = function() layout_popup.visible = true  end,
    stop_callback  = function() layout_popup.visible = false end,
    export_keybindings = true,
    stop_event = "release",
    stop_key = {"Escape", "Super_L", "Super_R"},
    keybindings = {
        {{ modkey, "Shift" } , " " , function()
            awful.layout.set((gears.table.cycle_value(ll.layouts, ll.current_layout, 1)))
        end},
        {{ modkey } , " " , function()
            awful.layout.set((gears.table.cycle_value(ll.layouts, ll.current_layout, 1)), nil)
        end},
    }
}
