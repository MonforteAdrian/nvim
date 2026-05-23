return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-media-files.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files hidden=true <CR>", desc = "Find files" },
    { "<leader>fi", "<cmd>Telescope media_files<CR>", desc = "Media files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
    { "<leader>fc", "<cmd>Telescope grep_string<CR>", desc = "Grep under cursor" },
    { "<leader>fb", "<cmd>Telescope buffers hidden=true initial_mode=normal<CR>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags hidden=true<CR>", desc = "Help tags" },
    { "<leader>fm", "<cmd>Telescope man_pages<CR>", desc = "Man pages" },
    { "<leader>fs", "<cmd>Telescope spell_suggest<CR>", desc = "Spell suggest" },
    { "<leader>gs", "<cmd>Telescope git_status hidden=true<CR>", desc = "Git status" },
  },
  opts = function()
    return require("config.telescope").opts()
  end,
  config = function(_, opts)
    require("config.telescope").setup(opts)
  end,
}
