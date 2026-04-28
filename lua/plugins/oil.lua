return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Disable netrw early so oil owns directory buffers.
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    -- Load on `-`, `:Oil`, or whenever a directory buffer is opened
    -- (handles `nvim .`, `nvim some/dir`, and `:edit some/dir`).
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    lazy = vim.fn.argc(-1) == 0 or vim.fn.isdirectory(vim.fn.argv(0) --[[@as string]]) == 0,
    opts = {
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
    },
  },
}
