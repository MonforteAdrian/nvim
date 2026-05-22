return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "classic",
    delay = function(ctx)
      return ctx.plugin and 0 or 300
    end,
    spec = {
      { "<leader>f", group = "find / format" },
      { "<leader>g", group = "git" },
      { "<leader>c", group = "code lsp", mode = { "n", "v" } },
      { "<leader>d", group = "diagnostics" },
      { "<leader>r", group = "rust" },
      { "<leader>L", desc = "Lazy" },
      { "<leader>M", desc = "Mason" },
      { "<leader>p", desc = "Copilot NES: accept & goto" },
    },
  },
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
