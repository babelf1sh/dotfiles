local theme_assets = require('beautiful.theme_assets')
local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi

local gfs   = require('gears.filesystem')
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font          = 'OCRA 12'
--theme.icon_font     = 'compacticons-tatosxl'
--theme.icon_size     = 12

theme.bg_normal     = '#191a24'
theme.bg_focus      = '#1e1f29'
theme.bg_urgent     = '#904e55'
theme.bg_minimize   = '#444444'
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = '#cac3bb'
theme.fg_focus      = '#ffffff'
theme.fg_urgent     = '#7c5868'
theme.fg_minimize   = '#cac3bb'

theme.border_width  = dpi(1) 
theme.border_color_normal = '#191a24'
theme.border_color_active = '#1e1f29'

theme.taglist_fg_focus = '#7c5868'
theme.taglist_bg_focus = 'transparent'

theme.hotkeys_label_bg = '#7c5868'
theme.hotkeys_modifiers_fg = '#7c5868'
theme.hotkeys_font = 'OCRA 10'
theme.hotkeys_description_font = 'OCRA 10'
theme.hotkeys_group_margin = '20'

theme.revelation_border_color = '#cac3bb'
theme.revelation_border_width = '1.5'

theme.popup_border_color = '#7c5868'
theme.popup_border_width = 3

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:



-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

theme.notification_width = '500'
theme.notification_height = '300'
theme.notification_border_width = '0'

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = '~/.config/awesome/theme/icons/menu_arrow.png'
theme.menu_height = dpi(25)
theme.menu_width  = dpi(125)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = '#cc0000'

-- Define the image to load
theme.titlebar_close_button_normal = '~/.config/awesome/theme/buttons/close.png'
theme.titlebar_close_button_focus  = '~/.config/awesome/theme/buttons/close_focus.png'

theme.titlebar_minimize_button_normal = '~/.config/awesome/theme/buttons/min.png'
theme.titlebar_minimize_button_focus  = '~/.config/awesome/theme/buttons/min_focus.png'

theme.titlebar_maximized_button_normal_inactive = '~/.config/awesome/theme/buttons/max.png'
theme.titlebar_maximized_button_focus_inactive  = '~/.config/awesome/theme/buttons/max_focus.png'
theme.titlebar_maximized_button_normal_active = '~/.config/awesome/theme/buttons/max_active.png'
theme.titlebar_maximized_button_focus_active  = '~/.config/awesome/theme/buttons/max_active.png'

theme.wallpaper = '~/.config/awesome/theme/walls/blue sky crane.jpg'

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path..'default/layouts/fairhw.png'
theme.layout_fairv = themes_path..'default/layouts/fairvw.png'
theme.layout_floating  = themes_path..'default/layouts/floatingw.png'
theme.layout_magnifier = themes_path..'default/layouts/magnifierw.png'
theme.layout_max = themes_path..'default/layouts/maxw.png'
theme.layout_fullscreen = themes_path..'default/layouts/fullscreenw.png'
theme.layout_tilebottom = themes_path..'default/layouts/tilebottomw.png'
theme.layout_tileleft   = themes_path..'default/layouts/tileleftw.png'
theme.layout_tile = themes_path..'default/layouts/tilew.png'
theme.layout_tiletop = themes_path..'default/layouts/tiletopw.png'
theme.layout_spiral  = themes_path..'default/layouts/spiralw.png'
theme.layout_dwindle = themes_path..'default/layouts/dwindlew.png'
theme.layout_cornernw = themes_path..'default/layouts/cornernww.png'
theme.layout_cornerne = themes_path..'default/layouts/cornernew.png'
theme.layout_cornersw = themes_path..'default/layouts/cornersww.png'
theme.layout_cornerse = themes_path..'default/layouts/cornersew.png'

-- Generate Awesome icon:
--theme.awesome_icon = theme_assets.awesome_icon(
--    theme.menu_height, theme.bg_focus, theme.fg_focus
--)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = trace

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
