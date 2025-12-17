
-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#rust_analyzer
-- rust-analyzer provides IDE-like features for Rust

return {
  -- Command and arguments to start the server.
  cmd = { 'rust-analyzer' },

  -- Filetypes to automatically attach to.
  filetypes = { 'rust' },

  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains a Cargo.toml file (indicating a Rust project).
  -- Files that share a root directory will reuse the connection to the same LSP server.
  root_markers = { 'Cargo.toml', '.git' },

  -- Specific settings for rust-analyzer.
  -- Full schema: https://rust-analyzer.github.io/manual.html#configuration
  settings = {
    ['rust-analyzer'] = {
      -- Enable cargo check on save
      checkOnSave = true,
      -- Use clippy for more thorough linting
      check = {
        command = "clippy"
      }
    }
  }
}
