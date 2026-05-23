local M = {}

function M.opts()
  return {
    keymap = {
      preset = "default",
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-l>"] = { "snippet_forward", "fallback" },
      ["<C-h>"] = { "snippet_backward", "fallback" },
      ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      documentation = { auto_show = true },
      list = { selection = { preselect = false, auto_insert = false } },
      ghost_text = { enabled = true },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
        path = {
          enabled = function()
            return vim.bo.filetype ~= "copilot-chat"
          end,
        },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  }
end

return M
