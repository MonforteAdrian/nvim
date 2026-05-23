local M = {}

function M.setup_nes()
  vim.g.copilot_nes_debounce = 500

  -- Smart <Tab> in normal mode:
  --   1st press: jump cursor to the start of the pending NES edit
  --   2nd press: apply the edit and jump to its end
  --   no NES pending: fall back to <C-i> (jump-list forward)
  require("core.util").map("n", "<Tab>", function()
    local bufnr = vim.api.nvim_get_current_buf()
    if vim.b[bufnr].nes_state then
      local nes = require("copilot-lsp.nes")
      return nes.walk_cursor_start_edit() or (nes.apply_pending_nes() and nes.walk_cursor_end_edit())
    end
    return "<C-i>"
  end, { desc = "Copilot NES: walk/apply pending edit", expr = true })
end

function M.copilot_opts()
  return {
    suggestion = { enabled = false },
    panel = { enabled = false },
    nes = {
      enabled = false,
      keymap = {
        accept_and_goto = "<leader>p",
        accept = false,
        dismiss = "<Esc>",
      },
    },
    filetypes = {
      markdown = true,
      help = true,
    },
  }
end

return M
