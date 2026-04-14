
-- Set the conceallevel, which "hides" bits of markdown, like back-ticks.
--   0 = Concealed text is shown normally — nothing hidden
--   1 = Each concealed region is replaced with one character (or a space)
--   2 = Concealed text is completely hidden unless the cursor is on that line
--   3 = Concealed text is always hidden, even when the cursor is on that line
-- I had this set to 2 for a while, and hated it.
vim.opt_local.conceallevel = 0

