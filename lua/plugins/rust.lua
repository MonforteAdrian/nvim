return {
  -- Don't forget to install rust-analyzer in the computer, not in mason:
  --rustup component add rust-analyzer
  {
    "mrcjkb/rustaceanvim",
    version = "^7", -- Recommended
    lazy = false,
    init = function()
      require("config.rust").rustaceanvim()
    end,
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
    opts = {},
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    priority = 1,
    opts = function()
      return require("config.rust").neotest_opts()
    end,
  },
}
