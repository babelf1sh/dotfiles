local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi  

return {
	 terminal = 'wezterm',
	 favorites = { 'vivaldi', 'thunar' },
	 search_commands = true,
	 
	 skip_names = { 'Network Connections', 'compfy', 'cmake', 'avahi', 'vim', 'gvim', 'neovim', 'electron', 'fish', 'lstopo', 'htop', 'File Manager Settings', 'Bulk Rename', 'Removable Drives and Media', 'Qt V4L2 video capture utility', 'Qt V4L2 test utility', 'QDBusViewer', 'Qt Assistant', 'Qt Designer', 'Qt Linguist', 'LSHW', 'OpenJDK Java 22 Shell', 'OpenJDK Java 22 Console' },
	 
	 default_app_icon_name = '',
	 default_app_icon_path = '',
	 icon_size  = 192,

	 type = 'normal',
	 placement = awful.placement.centered,
	 shrink_width = true,

	 background = beautiful.bg_launcher,
	 border_color = beautiful.border_color_active,
	 --[[ shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 3)
    end ]]

-- {{ prompt
	 prompt_height = dpi(35),
	 prompt_margins = dpi(5),
	 prompt_paddings = dpi(5),
	 
	 prompt_color = beautiful.fg_accent,
	 prompt_show_icon = false,
	 prompt_icon_text_spacing = dpi(5),
	 prompt_icon_color = beautiful.bg_launcher,
	 prompt_text_color = beautiful.bg_launcher,
	 prompt_cursor_color = beautiful.bg_launcher,
-- }}
	
-- {{ apps
	 apps_per_row = 3, 
	 app_width = dpi(64),
	 app_height = dpi(22),
	 app_content_padding = dpi(5),
	 app_icon_width = dpi(64),
	 app_icon_height = dpi(64),
	 app_show_name = false,
	 app_selected_color = beautiful.fg_accent,
-- }} 

}
