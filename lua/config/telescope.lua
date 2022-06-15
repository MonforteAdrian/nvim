local actions = require("telescope.actions")
local sorters = require("telescope.sorters")
require("telescope").setup{
  defaults = {
    file_ignore_patterns = { ".cache", ".local", ".git", ".cargo", ".npm", ".pki", ".rustup",
      "google%-chrome", "discord", "GIMP", "gtk%-2.0", "gtk%-3.0", "opt" },
    mappings = {
      i = {
      },
    },
  },
  pickers = {
    sorter = sorters.get_generic_fuzzy_sorter(),
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
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
require('telescope').load_extension('media_files')
