
-- Enable these LSP servers. The actual configs are in the /lsp directory off the root of the nvim
-- config. The names of those files must match the names used here.
vim.lsp.enable('csharp_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('ruff')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('terraform_ls')

-- Configure diagnostics.
vim.diagnostic.config({
    -- Config block that shows diagnostics on the line(s) below the line with the diagnostic. I'm finding this
    -- too distracting, so I'm going to switch back to diagnostics on the end of the line.
    -- BEGIN
    -- Show error messages below the line with the issue.
    -- virtual_lines = true,
    --  virtual_lines = {
    --     current_line = true,
    -- },

    -- It is recommended to disable virtual_text to avoid conflicts
    -- virtual_text = false,
    -- END

    -- Show diagnostic messages on the right side of the line
    virtual_text = true

    -- Only show the virtual text for the current line; showing everything was too much.
    -- Use the sign column to locate lines with issues.
    -- virtual_text = {
    --     current_line = true,
    -- },
})

-- For buffers that have LSP enabled, set up some things
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- KEY MAPPINGS FOR BUFFERS WITH LSP ENABLED

        -- local map = function(keys, func, desc)
        --     vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
        -- end

        local tele = require("telescope.builtin")

        -- go to the symbol's declaration, which might be just a type signature or prototype without the implementation
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,
            { buffer = ev.buf, desc = 'LSP: Goto Declaration' })

        -- go to the actual place(s) where a symbol (function, variable, class) is defined and given a value.
        vim.keymap.set('n', 'gd', tele.lsp_definitions,
            { buffer = ev.buf, desc = 'LSP: Goto Definition (via telescope)' })

        -- display a list of all known diagnostics (warnings, errors, hints)
        vim.keymap.set('n', '<leader>fd', tele.diagnostics,
            { buffer = ev.buf, desc = 'LSP: Diagnostics (via telescope)' })

        -- list references for the word under the cursor
        vim.keymap.set('n', '<leader>fr', tele.lsp_references,
            { buffer = ev.buf, desc = 'LSP: Goto References (via telescope)' })

        -- list the methods and functions in the current document
        vim.keymap.set("n", "<leader>fs", function()
            require("telescope.builtin").lsp_document_symbols({
                symbols = {
                    "Method",
                    "Function",
                }
            })
        end, { desc = "LSP: Doc Symbols (via telescope)" })

        -- rename the symbol under the cursor
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,
            { buffer = ev.buf, desc = 'LSP: Rename symbol' })

        -- TODO: why doesn't `gf` work on the following line? It seems to be treating the `.lua` as `/lua`?
        -- NOTE: code-action (ca) binding is in the plugins/tiny-code-action-nvim.lua plugin setup
        -- vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action,
        --     { buffer = ev.buf, desc = "LSP: code action" })

        -- map('<leader>fS', tele.lsp_dynamic_workspace_symbols, 'Dynamic Symbols')
        -- map('<leader>ft', tele.lsp_type_definitions, 'Goto Type')
        -- map('<leader>fi', tele.lsp_implementations, 'Goto Impl')
        --
        -- map('K', vim.lsp.buf.hover, 'hover')
        -- map('<leader>E', vim.diagnostic.open_float, 'diagnostic')
        -- map('<leader>k', vim.lsp.buf.signature_help, 'sig help')
        -- map('<leader>rn', vim.lsp.buf.rename, 'rename')
        -- map('<leader>ca', vim.lsp.buf.code_action, 'code action')
        -- map('<leader>wf', vim.lsp.buf.format, 'format')
        --
        -- vim.keymap.set('v',
        --     '<leader>ca',
        --     vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'Lsp: code_action' })
        --
        -- local dap = require('dap')
        -- map('<leader>dt', dap.toggle_breakpoint, 'Toggle Break')
        -- map('<leader>dc', dap.continue, 'Continue')
        -- map('<leader>dr', dap.repl.open, 'Inspect')
        -- map('<leader>dk', dap.terminate, 'Kill')
        --
        -- map('<leader>dso', dap.step_over, 'Step Over')
        -- map('<leader>dsi', dap.step_into, 'Step Into')
        -- map('<leader>dsu', dap.step_out, 'Step Out')
        -- map('<leader>dl', dap.run_last, 'Run Last')
        --
        -- local dapui = require('dapui')
        -- map('<leader>duu', dapui.open, 'open ui')
        -- map('<leader>duc', dapui.close, 'open ui')

    end,
})

