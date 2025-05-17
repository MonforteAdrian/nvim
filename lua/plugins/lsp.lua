local map = vim.keymap.set
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
      },
      "jay-babu/mason-nvim-dap.nvim",
      "williamboman/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- Set up Mason before anything else
      require("mason").setup({
        ui = {
          -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          border = "none",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "clangd",
          "cmake",
          "lua_ls",
          "jsonls",
          "taplo",
        },
        automatic_installation = true,
      })

      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb", "stylua", "shfmt" },
        automatic_installation = true,
      })
      -- Turn on LSP status information
      require("fidget").setup()

      -- Set up cool signs for diagnostics
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Diagnostic config
      local config = {
        virtual_text = true,
        signs = true,
        update_in_insert = true,
        underline = true,
        severity_sort = false,
        float = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      }
      vim.diagnostic.config(config)

      local disable_semantic_tokens = {
        lua = true,
      }

      -- This function gets run when an LSP connects to a particular buffer.
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

          map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
          map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
          -- TODO keep using telescope?
          map("n", "gr", require("telescope.builtin").lsp_references, { desc = "Goto References" })
          map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
          map("n", "gy", vim.lsp.buf.type_definition, { desc = "Type definition" })
          map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
          map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
          -- TODO keep looking lazyvim mappings
          map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename symbol" })
          map("n", "<leader>ls", require("telescope.builtin").lsp_document_symbols, { desc = "Document symbols" })

          local filetype = vim.bo[bufnr].filetype
          if disable_semantic_tokens[filetype] then
            client.server_capabilities.semanticTokensProvider = nil
          end
        end,
      })

      vim.lsp.enable('bashls')
      vim.lsp.enable('clangd')
      vim.lsp.enable('cmake')
      vim.lsp.enable('jsonls')
      vim.lsp.enable('taplo')
      vim.lsp.enable('copilot-lsanguage-server')
      -- Lua
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
              checkThirdParty = false,
            },
          },
        },
      })
      vim.lsp.enable('lua_ls')
    end,
  },
}
