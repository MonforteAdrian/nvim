-- nvim-treesitter `main` branch (rewrite, required for Neovim 0.12+).
-- Requires `tree-sitter-cli` (>= 0.26.1) and a C compiler available in $PATH.
-- The old `master` branch API (require("nvim-treesitter.configs").setup{...})
-- no longer applies; highlight/fold/indent must be enabled per-buffer.

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false, -- main branch does not support lazy-loading
  build = ":TSUpdate",
  config = function()
    require("config.treesitter").setup()
  end,
}
