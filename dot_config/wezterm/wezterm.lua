-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action


-- OS detection
local is_darwin = function()
    return wezterm.target_triple:find("darwin") ~= nil
end

local is_windows = function()
    return wezterm.target_triple:find("windows") ~= nil
end


-- Set the window title
wezterm.on('format-window-title', function(window)
  -- TODO: this could be dynamic
  return "WezTerm"
end)


-- This will hold the configuration.
local config = wezterm.config_builder()

-- Our favorite shell(s)
local git_bash = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login", "-i" }
local cmd_exe = { "C:\\WINDOWS\\system32\\cmd.exe" }
local wsl_def = { "wsl.exe", "--cd", "~" }
local wsl_bash = { "wsl.exe", "--cd", "~", "-e", "/bin/bash", "-i", "-l" }
local zsh = { "/bin/zsh", "-i", "-l" }

if is_windows() then
    config.default_prog = git_bash
else
    -- TODO: what if zsh does not exist?
    config.default_prog = zsh
end

-- Launch menu
config.launch_menu = {
  {
    label = "Git Bash",
    args = git_bash
  },
  {
    label = "WSL (default, zsh)",
    args = wsl_def
  },
  {
    label = "WSL (default, bash)",
    args = wsl_bash
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
  { key = '3', mods = 'ALT', action = act.ActivateTab(2) },
  { key = '4', mods = 'ALT', action = act.ActivateTab(3) },
  { key = '5', mods = 'ALT', action = act.ActivateTab(4) },
  { key = '6', mods = 'ALT', action = act.ActivateTab(5) },
  { key = '7', mods = 'ALT', action = act.ActivateTab(6) },
  { key = '8', mods = 'ALT', action = act.ActivateTab(7) },
  { key = '9', mods = 'ALT', action = act.ActivateTab(8) },

  -- new (t)ab - default shell
  { key = 't', mods = 'ALT', action = act.SpawnCommandInNewTab { args = config.default_prog, cwd = wezterm.home_dir } },
  { key = 't', mods = 'CMD', action = act.SpawnCommandInNewTab { args = config.default_prog, cwd = wezterm.home_dir } },

  -- new (w)sl tab, using zsh
  { key = 'w', mods = 'ALT', action = act.SpawnCommandInNewTab { args = wsl_def } },

  -- new (w)sl tab, using zsh
  { key = 'b', mods = 'ALT', action = act.SpawnCommandInNewTab { args = wsl_bash } },

  -- new (d)os tab
  { key = 'd', mods = 'ALT', action = act.SpawnCommandInNewTab { args = cmd_exe } },

  -- enable pasting with ctrl+v
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },

  -- new window bindings
  -- TODO: should I be setting the command, here?
  { key = 'n', mods = 'CMD', action = act.SpawnCommandInNewWindow { cwd = wezterm.home_dir } },
  { key = 'n', mods = 'SHIFT|CTRL', action = act.SpawnCommandInNewWindow { cwd = wezterm.home_dir } },
}


-- Start off with a larger window
-- TODO: on Mac, at work with lower-res monitor, the window kept overflowing the screen at start, so I slimmed these down to help a bit
config.initial_cols = 100
config.initial_rows = 30


-- Bump up the font size
-- TODO: can we base this off screen resolution?
if is_darwin() then
    config.font_size = 16
end


-- Configure tabs
config.tab_bar_at_bottom = true
config.window_frame = {
  font_size = 16.0,
}


-- Disable ligatures (combining < and = into one character, for example)
-- See https://wezterm.org/config/font-shaping.html
config.harfbuzz_features = { 'calt=0' }


-- Finally, return the configuration to wezterm:
return config

