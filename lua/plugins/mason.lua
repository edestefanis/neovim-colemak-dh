-- mason.lua (can be in ~/.config/nvim/lua/mason.lua or similar)
require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = { "sumneko_lua", "kotlin-language-server", "ts_ls" },
})
