-- Go-specific settings
-- Disable listchars (whitespace visibility) since Go uses tabs
vim.opt_local.list = false

-- Format on save using LSP
vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = 0,  -- 0 means current buffer in ftplugin context
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
