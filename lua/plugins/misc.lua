-- Miscelaneous
return {
  -- neorg dependency
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  -- Utilites
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({})
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function()
      require("conform").setup({
        formatters_by_ft = {
          markdown = { "prettierd", "prettier", stop_after_first = true },
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
    end,
  }
}
