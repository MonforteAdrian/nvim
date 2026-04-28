-- Lua LSP enhancements when editing Neovim configs / plugins.
-- Auto-feeds your installed plugins' Lua API into lua_ls so you get completions
-- and hover for `require("oil")`, `require("neorg")`, vim.lsp.*, etc.
return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Always load Neovim runtime types
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        -- Load lazy.nvim types when the spec is being edited
        { path = "lazy.nvim", words = { "LazyVim" } },
      },
    },
  },
}
