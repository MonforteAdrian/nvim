local M = {}

local icons = require("core.icons")

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

function M.opts()
  local colorscheme = require("helpers.colorscheme")
  local lualine_theme = colorscheme == "default" and "auto" or colorscheme

  return {
    options = {
      icons_enabled = true,
      theme = lualine_theme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        { "branch", icon = icons.git.branch },
        { "diff", source = diff_source },
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.lualine.error,
            warn = icons.diagnostics.lualine.warn,
            hint = icons.diagnostics.lualine.hint,
            info = icons.diagnostics.lualine.info,
          },
          sources = { "nvim_lsp" },
        },
      },
      lualine_c = { "filename" },
      lualine_x = { "filetype", "fileformat" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { "nvim-dap-ui", "nvim-tree", "quickfix", "toggleterm" },
  }
end

return M
