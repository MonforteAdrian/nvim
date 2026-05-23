return {
  -- NES (Next Edit Suggestion) glue for copilot.lua 2.x.
  -- This is a Lua plugin, not an LSP server — it drives NES UI on top of the
  -- `copilot-language-server` binary (installed via Mason in lua/plugins/lsp.lua).
  {
    "copilotlsp-nvim/copilot-lsp",
    init = function()
      require("config.ai").setup_nes()
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
    opts = function()
      return require("config.ai").copilot_opts()
    end,
  },
}
