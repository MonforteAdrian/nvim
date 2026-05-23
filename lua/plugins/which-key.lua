return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function()
    return require("config.which-key").opts()
  end,
  keys = {
    {
      "<leader>!",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer-local keymaps (which-key)",
    },
  },
}
