return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = function()
      return require("config.catppuccin").opts()
    end,
  },
}
