local awful = require('awful')

local mod    = require('binds.mod')
local modkey = mod.modkey

local apps    = require('config.apps')
local widgets = require('ui')

local revelation = require("revelation")
revelation.init()

awful.keyboard.append_global_keybindings({

  -- command keys
	-- open config
	 awful.key({}, "XF86AudioMedia",
	 	  function()
		  os.execute("Arandr")
	     end, {description = "open config", group = "hotkeys"}),
   -- volume
    awful.key({}, "XF86AudioMute",
        function()
        os.execute("pamixer -t")
        end, {description = "toggle mute", group = "hotkeys"}),
    awful.key({}, "XF86AudioLowerVolume",
        function()
        os.execute("pactl set-sink-mute 0 false ; pamixer -d 5")
        end, {description = "lower volume", group = "hotkeys"}),
    awful.key({}, "XF86AudioRaiseVolume",
        function()
        os.execute("pactl set-sink-mute 0 false ; pamixer -i 5")
        end, {description = "raise volume", group = "hotkeys"}),

   -- brightness
    awful.key({}, "XF86MonBrightnessDown",
        function()
        os.execute("brightnessctl set 2%-")
        end, {description = "lower brightness", group = "hotkeys"}),
    awful.key({}, "XF86MonBrightnessUp",
        function()
        os.execute("brightnessctl set +2%")
        end, {description = "raise brightness", group = "hotkeys"}),

    -- lockscreen
      awful.key({ modkey}, "l",
        function()
        os.execute("xsecurelock")
        end, {description = "lockscreen", group = "hotkeys"}),

	 -- revelation
	 	awful.key({ modkey, "Shift"	}, "a", revelation),
		awful.key({ modkey }, "a", function()
		  revelation({rule={class="conky"}, is_excluded=true, curr_tag_only=true})
		  end),

	 -- maim (screenshot & copy)
		awful.key({}, "Print", 
		  function()
		  os.execute("maim -s | xclip -selection clipboard -t image/png -i")
	     end, {description = "screenshot selection & copy to clipboard", group = "hotkeys"}), 

	 -- maim (screenshot, copy, & save)
	  	awful.key({ "Control" }, "Print", 
		  function()
		  os.execute(" maim -s | tee $HOME/pictures/screenshots/ss_$(date +%m-%d_%T).png | xclip -selection clipboard -t image/png -i")
	     end, {description = "screenshot selection & copy to clipboard", group = "hotkeys"}), 

	-- General Awesome keys
    awful.key({ modkey,           }, "/",      require('awful.hotkeys_popup').show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "w", function () widgets.menu.main:show() end,
              {description = "show main menu", group = "awesome"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
   awful.key({ modkey,           }, "Return", function () awful.spawn(apps.terminal) end,
              {description = "open a terminal", group = "launcher"}),
   awful.key({ modkey },            "Tab", function() require('menubar').show() require('menubar').refresh() end,
    			  {description = "show the menubar", group = "launcher"}),

	-- Tags related keybindings
    awful.key({ modkey, "Control" }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey, "Control" }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control" },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control", "Shift" },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },

	-- Focus related keybindings
    awful.key({ "Mod1",           }, "Tab",
        function ()
            awful.client.focus.byidx( 1)
        end,
              {description = "focus next by index", group = "client"}
    ),
    awful.key({ "Mod1", "Control" }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end, 
              {description = "go back", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),

	-- Layout manipulation
    awful.key({ modkey,           }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey,           }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey,  "Shift"  }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,  "Shift"  }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    
	-- Standard program
    awful.key({ modkey, "Mod1"    }, "Left",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Mod1"    }, "Right",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
--[[ 
-- handled by layout popup widget

awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
				  ]]				  
    awful.key({ modkey, "Shift"   }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:activate { raise = true, context = "key.unminimize" }
					  end
              end,
              {description = "restore minimized", group = "client"}),

})
