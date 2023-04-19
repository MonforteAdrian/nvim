require("nvim-tree").setup {
  disable_netrw = false,
  actions = {
    open_file = {
      window_picker = {
        enable = true,
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

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
