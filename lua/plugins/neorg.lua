return {
  "nvim-neorg/neorg",
  dependencies = { "luarocks.nvim", "nvim-treesitter/nvim-treesitter", "benlubas/neorg-interim-ls" },
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  ft = "norg",
  opts = function()
    return require("config.neorg").opts()
  end,
  config = function(_, opts)
    require("config.neorg").setup(opts)
  end,
}
