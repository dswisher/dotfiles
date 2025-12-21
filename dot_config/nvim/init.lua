
-- Core options and settings that apply to everything
require("swish.core")

-- Plugins!
require("swish.lazy")

-- Set the theme
--   I _think_ this is used so that telescope color-pick thingy can set the theme (which I have not yet set up)
require("current-theme")

-- Set up LSP options, like key binds
require("swish.lsp_options")

-- Override things that may be set by the colorscheme or w/e
require("swish.overrides")

