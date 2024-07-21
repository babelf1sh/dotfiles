local awful = require('awful')
local ruled = require('ruled')

-- {{{ Rules
-- Rules to apply to new clients.
ruled.client.connect_signal('request::rules', function() 
   
	-- All clients will match this rule.
    ruled.client.append_rule {
		  id         = 'global',
        rule       = { },
		  properties = { 
				focus = awful.client.focus.filter,
				raise = true,             
				screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen+awful.placement.centered
        }
    }
    
	-- Add titlebars to normal clients and dialogs
    ruled.client.append_rule {
		  id			 = 'titlebars',
		  rule_any	 = { type = { 'normal', 'dialog' } },
		  except_any = { 
			     name = { 
					  'Event Tester', -- xev
					  'Picture in picture', -- vivaldi
					  'Discord Updater',
					  'BetterDiscord',
					  'stalonetray', },
				  class = { 'mpv' },
		  },
		  properties = { titlebars_enabled = true }
    }

   -- floating clients
    ruled.client.append_rule {
		  id			 = 'floating',
		  rule_any	 = {
        		class  = {
           		 'pavucontrol',
					 'Nm-connection-editor',
					 'font-manager',
					 'Thunar',
					 'org.wezfurlong.wezterm',
					 'Blueman-manager',
					 'mpv',
					 'Proton Pass',
					 'file-roller',

      },
				name = {
					'Event Tester',
					'Picture in picture',
		},
	  },
	   except_any = { name = { 'File Operation Progress', 'Create New Folder', 'Confirm to replace files' } },
	   properties = { floating = true, width = 1500, height = 1000 }
	  }
   
	-- fullscreen clients
	 ruled.client.append_rule { 
		 	 rule_any = { class = { 'zoom', 'mpv' }, },
		 	 properties = { fullscreen = true } }

   -- Set programs to always map on the tag named '2' on screen 1.
    ruled.client.append_rule { 
		  rule_any = { 
	         class = { 
	             'discord', 
	       		 'Spotify',
			 		 'Jellyfin Media Player',
			 		 'Deluge-gtk',
		 },
      }, properties = { tag = screen[1].tags[2], switch_to_tags = true } }
   
end)
-- }}}
