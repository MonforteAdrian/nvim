-- folke/snacks.nvim — collection of small QoL plugins.
-- Enabled modules:
--   notifier: pretty `vim.notify` with history
--   lazygit:  themed lazygit float (replaces kdheepak/lazygit.nvim)
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      lazygit = { enabled = true },
    },
    keys = {
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        desc = "LazyGit",
      },
      {
        "<leader>nh",
        function()
          Snacks.notifier.show_history()
        end,
        desc = "Notification history",
      },
      {
        "<leader>nd",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss all notifications",
      },
    },
  },
}
