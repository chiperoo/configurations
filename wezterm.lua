-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
  config:set_strict_mode(true)
end

-- This is where you actually apply your config choices

config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- This will create a new split and run your default program inside it
  {
    key = 'd',
    mods = 'SHIFT|CMD',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}

return config
