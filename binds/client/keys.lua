local awful = require('awful')

local mod    = require('binds.mod')
local modkey = mod.modkey

-- More client manipulation
client.connect_signal('request::default_keybindings', function()
   awful.keyboard.append_client_keybindings({
    
	 awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "toggle fullscreen", group = "client" }),
	 awful.key({ modkey,           }, "q",      function (c) c:kill()  end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey,           }, "s",      function (c) c.sticky = not c.sticky  end,
              {description = "toggle sticky window", group = "client"}),
    awful.key({ modkey,	"Control" }, "t",      awful.titlebar.toggle				,
	      {description = "toggle titlebar", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,        {description = "minimize", group = "client"}),

    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey,           }, "Down",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Control"  }, "Up",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,	
        {description = "(un)maximize horizontally", group = "client"}),

   -- Client position in tiling management
	 awful.key({ modkey, mod.ctrl  }, 'Return', function(c) c:swap(awful.client.getmaster()) end,
         { description = 'move to master', group = 'client' }),
      awful.key({ modkey,           }, 'o', function(c) c:move_to_screen() end,
         { description = 'move to screen', group = 'client' }),
      awful.key({ modkey,           }, 't', function(c) c.ontop = not c.ontop end,
         { description = 'toggle keep on top', group = 'client' })
 })
end)
