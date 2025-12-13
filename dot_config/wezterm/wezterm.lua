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
local cmd_exe = { "C:\\WINDOWS\\system32\\cmd.exe" }
local wsl_def = { "wsl.exe", "--cd", "~" }

config.default_prog = git_bash

-- Launch menu
config.launch_menu = {
  {
    label = "Git Bash",
    args = git_bash
  },
  {
    label = "WSL (default)",
    args = wsl_def
  },
  {
    label = "cmd.exe",
    args = cmd_exe
  },
}


-- TODO: to disable all default key bindings
-- config.disable_default_key_bindings = true


-- Set up some key bindings
config.keys = {
  { key = '1', mods = 'ALT', action = act.ActivateTab(0) },
  { key = '2', mods = 'ALT', action = act.ActivateTab(1) },

  { key = 's', mods = 'ALT', action = act.SpawnCommandInNewTab { args = git_bash } },
  { key = 'q', mods = 'ALT', action = act.SpawnCommandInNewTab { args = wsl_def } },
  { key = 'w', mods = 'ALT', action = act.SpawnCommandInNewTab { args = cmd_exe } },

  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
}


-- Start off with a larger window
config.initial_cols = 160
config.initial_rows = 40


-- Finally, return the configuration to wezterm:
return config

