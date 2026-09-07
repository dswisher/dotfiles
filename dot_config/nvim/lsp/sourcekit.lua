-- SourceKit-LSP is shipped with Xcode and the Swift toolchain.
-- See https://github.com/apple/swift-sourcekit-lsp

return {
  -- Use xcrun so the server comes from the currently selected Xcode/toolchain.
  cmd = { 'xcrun', 'sourcekit-lsp' },

  filetypes = { 'swift' },

  -- Prefer the Swift package root, while still supporting standalone files and
  -- Xcode projects kept in a Git repository.
  root_markers = {
    'buildServer.json',
    'Package.swift',
    '*.xcodeproj',
    '*.xcworkspace',
    '.git',
  },
}
