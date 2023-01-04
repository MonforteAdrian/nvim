local actions = require("telescope.actions")
local sorters = require("telescope.sorters")
require("telescope").setup{
  defaults = {
    file_ignore_patterns = { "qmk_firmware", ".mozilla", ".git", "Downloads", ".local", "wallpapers", ".cache" },
    mappings = {
      i = {
      },
    },
  },
  pickers = {
    sorter = sorters.get_generic_fuzzy_sorter(),
    find_files = {
      --find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    },
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  }
}
require('telescope').load_extension('dap')
require('telescope').load_extension('media_files')
