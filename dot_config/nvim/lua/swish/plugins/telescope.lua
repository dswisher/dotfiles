
-- See https://github.com/nvim-telescope/telescope.nvim

return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close
                    },
                },
            },

            pickers = {
                buffers = {
                    sort_mru = true,
                },
                lsp_document_symbols = {
                    symbol_width = 70,
                },
            },
        })

        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'telescope: buffers' })
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'telescope: find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'telescope: live grep' })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'telescope: list keymaps' })

        -- TODO: I'd like to filter out the "special" marks like the numbers and punctuation
        vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'telescope: marks' })
    end
}
