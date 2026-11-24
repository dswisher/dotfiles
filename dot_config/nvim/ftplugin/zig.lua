-- Format on save using ZLS
vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = 0,  -- 0 means current buffer in ftplugin context
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
