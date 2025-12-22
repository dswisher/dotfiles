
-- See https://github.com/rachartier/tiny-code-action.nvim
-- For the delta tool, see https://github.com/dandavison/delta

return {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-telescope/telescope.nvim"},
    },
    event = "LspAttach",
    opts = {
        --- The backend to use, currently only "vim", "delta", "difftastic", "diffsofancy" are supported
        backend = "delta",

        -- The picker to use, "telescope", "snacks", "select", "buffer", "fzf-lua" are supported
        -- And it's opts that will be passed at the picker's creation, optional
        --
        -- You can also set `picker = "<picker>"` without any opts.
        picker = "telescope",
        backend_opts = {
            delta = {
                -- Header from delta can be quite large.
                -- You can remove them by setting this to the number of lines to remove
                header_lines_to_remove = 4,

                -- The arguments to pass to delta
                -- If you have a custom configuration file, you can set the path to it like so:
                -- args = {
                --     "--config" .. os.getenv("HOME") .. "/.config/delta/config.yml",
                -- }
                args = {
                    "--line-numbers",
                },
            },
        },
    },
    config = function()
        local tiny = require("tiny-code-action")

        vim.keymap.set({ "n", "x" }, "<leader>ca", function() tiny.code_action() end,
        { noremap = true, silent = true })
    end
}
