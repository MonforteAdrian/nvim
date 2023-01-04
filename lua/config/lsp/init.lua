require'lspconfig'.clangd.setup{}
require("mason").setup()
require("mason-lspconfig").setup()
require("config.lsp.handlers").setup()
require "config.lsp.null-ls"
require "config.lsp.lspsaga"
