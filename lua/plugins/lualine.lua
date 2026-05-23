return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },
  opts = function()
    return require("config.lualine").opts()
  end,
}
