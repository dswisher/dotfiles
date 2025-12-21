
-- overrides.lua - loaded at the end of init.lua


-- Override the color scheme value for floating window borders
--    (in the current scheme, they have a white BG which is hard on the eyes)
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "white", bg = "black" })


-- Tweak the way comments and whatnot are handled when editing text.
--      r: auto-insert comment leader when hitting Enter in normal mode (disable)
--      o: auto-insert comment leader when hitting 'o' or 'O' in normal mode (disable)
--
-- For more info, do :help fo-table
--
-- This is done as a BufWinEnter because file-type plugins often override these settings,
-- so we tweak it after every buffer load.
vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

