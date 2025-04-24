return {
  -- Don't forget to install rust-analyzer in the computer, not in mason:
  --rustup component add rust-analyzer
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false,
    init = function()
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {
        },
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            -- you can also put keymaps in here
          end,
          default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
            },
          },
        },
        -- DAP configuration
        dap = {
        },
      }
    end
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
    config = function()
      require("crates").setup()
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    priority = 1,
    config = function()
      require('neotest').setup({
        adapters = {
          require('rustaceanvim.neotest')
        },
      })
    end,
  }
}
