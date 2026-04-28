return {
  -- NES (Next Edit Suggestion) glue for copilot.lua 2.x.
  -- This is a Lua plugin, not an LSP server — it drives NES UI on top of the
  -- `copilot-language-server` binary (installed via Mason in lua/plugins/lsp.lua).
  {
    "copilotlsp-nvim/copilot-lsp",
    init = function()
      vim.g.copilot_nes_debounce = 500

      -- Smart <Tab> in normal mode:
      --   1st press: jump cursor to the start of the pending NES edit
      --   2nd press: apply the edit and jump to its end
      --   no NES pending: fall back to <C-i> (jump-list forward)
      vim.keymap.set("n", "<Tab>", function()
        local bufnr = vim.api.nvim_get_current_buf()
        if vim.b[bufnr].nes_state then
          local nes = require("copilot-lsp.nes")
          return nes.walk_cursor_start_edit() or (nes.apply_pending_nes() and nes.walk_cursor_end_edit())
        end
        return "<C-i>"
      end, { desc = "Copilot NES: walk/apply pending edit", expr = true })
    end,
  },

  -- Copilot provider. Inline ghost text and panel are disabled because
  -- suggestions are surfaced through blink.cmp via blink-copilot
  -- (see lua/plugins/completion.lua). Requires Neovim >= 0.11 and Node.js >= 22.
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = { "copilotlsp-nvim/copilot-lsp" },
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      nes = {
        enabled = true,
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
    },
  },
}
