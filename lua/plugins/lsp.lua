return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
      },
      "jay-babu/mason-nvim-dap.nvim",
      "williamboman/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("config.lsp").setup()
    end,
  },
}
