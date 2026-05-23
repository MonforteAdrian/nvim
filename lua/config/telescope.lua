local M = {}

function M.opts()
  local actions = require("telescope.actions")
  local sorters = require("telescope.sorters")

  return {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "-L",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--trim",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      file_sorter = sorters.get_fuzzy_file,
      file_ignore_patterns = {
        "target",
        "qmk_firmware",
        ".mozilla",
        ".git",
        ".local",
        "wallpapers",
        ".cache",
      },
      generic_sorter = sorters.get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      mappings = {
        i = {
          [":q<Cr>"] = actions.close,
        },
      },
    },
    pickers = {
      sorter = sorters.get_generic_fuzzy_sorter(),
      find_files = {
        file_ignore_patterns = { "png", "webp", "jpg", "jpeg", "mp4", "gif" },
      },
      buffers = {
        sort_lastused = true,
        mappings = {
          n = {
            ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
          },
          i = {
            ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
          },
        },
      },
    },
    extensions = {
      media_files = {
        filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "gif" },
        find_cmd = "rg",
      },
    },
  }
end

function M.setup(opts)
  local telescope = require("telescope")

  telescope.setup(opts)
  telescope.load_extension("media_files")
end

return M
