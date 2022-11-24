require("nvim-tree").setup {
  disable_netrw = false,
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  filters = {
    custom = { ".git$", ".pyc$", "__pycache__" },
  },
  renderer = {
    special_files = {},
    icons = {
      show = {
        folder_arrow = false,
      },
      glyphs = {
        default = '',
        folder = {
          default = '',
          open = '',
          empty = '',
          empty_open = '',
        },
      },
    },
  },
}
