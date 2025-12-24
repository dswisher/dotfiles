
-- See https://github.com/nvim-treesitter/nvim-treesitter
-- Also: https://github.com/Sin-cy/dotfiles/blob/main/nvim/.config/nvim/lua/sethy/plugins/treesitter.lua

return {
    -- TODO: disable tree-sitter on windows; it is too painful to keep working
    --       do we *really* need it, even on mac/linux?

    -- {
    --     "nvim-treesitter/nvim-treesitter",
    --     branch = "master",
    --     event = { "BufReadPre", "BufNewFile" },
    --     build = ":TSUpdate",
    --     lazy = false,
    --
    --     config = function()
    --         local treesitter = require("nvim-treesitter.configs")
    --
    --         -- On windows, need to force it to use the MSFT compiler
    --         -- NOTE: On windows 11, it *does* return "Windows_NT"
    --         if vim.loop.os_uname().sysname == "Windows_NT" then
    --             require('nvim-treesitter.install').compilers = { "clang-cl" }
    --         end
    --
    --         treesitter.setup({
    --
    --             highlight = {
    --                 enable = true,
    --
    --                 -- disable built-in highlighting
    --                 additional_vim_regex_highlighting = false,
    --             },
    --
    --             -- ensure these languages parsers are installed
    --             ensure_installed = {
    --                 "c",
    --                 "lua",
    --                 "markdown",
    --                 "python",
    --                 "rust",
    --                 "sql",
    --             },
    --
    --         })
    --     end
    -- }
}

