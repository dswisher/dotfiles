-- SQL-specific settings
-- Format on save using sqlfluff, if available

-- TODO: This DOES NOT WORK right. There are times it gets stuck in a loop, writing over and over.

-- vim.api.nvim_create_autocmd("BufWritePre", {
--     buffer = 0, -- 0 means current buffer in ftplugin context
--     callback = function()
--         if vim.fn.executable("sqlfluff") == 0 then
--             return
--         end
--
--         local filepath = vim.api.nvim_buf_get_name(0)
--         if filepath == "" then
--             return
--         end
--
--         -- Write the buffer to disk first, then fix in place
--         vim.api.nvim_command("noautocmd write")
--         vim.fn.system({ "sqlfluff", "fix", "--force", filepath })
--
--         -- Reload the buffer from disk after sqlfluff modifies it,
--         -- then restore filetype so syntax highlighting and LSP are preserved
--         vim.api.nvim_command("noautocmd edit")
--         vim.opt_local.filetype = "sql"
--     end,
-- })

