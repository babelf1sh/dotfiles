local awful = require("awful")
local widgets = require("ui")

awful.mouse.append_global_mousebindings({
    awful.button({ }, 3, function () widgets.menu.main:toggle() end),
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext),
})
