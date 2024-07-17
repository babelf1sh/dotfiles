local apps = {}
apps.terminal = 'wezterm'
apps.editor = os.getenv('EDITOR') or 'nvim'
apps.editor_cmd = apps.terminal .. ' -e ' .. apps.editor
apps.files = 'thunar'

-- set the terminal for the menubar
require('menubar').utils.terminal = apps.terminal

return apps
