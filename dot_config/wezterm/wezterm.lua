-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action


-- Set the window title
wezterm.on('format-window-title', function(window)
  -- TODO: this could be dynamic
  return "WezTerm"
end)


-- This will hold the configuration.
local config = wezterm.config_builder()

-- Our favorite shell
local git_bash = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login", "-i" }

config.default_prog = git_bash

-- Launch menu
config.launch_menu = {
  {
    label = "Git Bash",
    args = git_bash
  },

  {
    label = "cmd.exe",
    args = { "C:\\WINDOWS\\system32\\cmd.exe" },
  },
}


-- Allow ctrl+v to paste
config.keys = {{ key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },}


-- Start off with a larger window
config.initial_cols = 160
config.initial_rows = 40


-- Finally, return the configuration to wezterm:
return config

