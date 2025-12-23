
-- See https://github.com/obsidian-nvim/obsidian.nvim

return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",    -- TODO: should I only enable this for actual obsidian markdown files? Does enabling for README.md matter?
    lazy = false,
    dependencies = {
        'nvim-telescope/telescope.nvim'
    },

    config = function()
        local obsidian = require("obsidian")
        local telescope = require("telescope.builtin")

        local vault_dir = "~/git/dswisher/my-obsidian-vault"

        obsidian.setup({
            legacy_commands = false, -- this will be removed in the next major release
            workspaces = {
                {
                    name = "my-vault",
                    path = vault_dir,
                },
            },
            daily_notes = {
                folder = "daily-journal",
                -- date_format = nil,
                -- alias_format = nil,
                -- default_tags = { "daily-notes" },
                workdays_only = false,
            },
        })

        -- Based on https://github.com/zazencodes/dotfiles/blob/main/nvim/lua/workflows.lua
        vim.keymap.set('n', '<leader>of', function()
            telescope.find_files({ cwd = vault_dir })
        end, { desc = 'obsidian: find files' })

        vim.keymap.set('n', '<leader>og', function()
            telescope.live_grep({ cwd = vault_dir })
        end, { desc = 'obsidian: live grep' })
    end,
}

