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

      -- This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(client, bufnr)
        local function opts(desc)
          return { buffer = bufnr, desc = "LSP " .. desc }
        end

        map("n", "gD", vim.lsp.buf.declaration, opts "Goto Declaration")
        map("n", "gd", vim.lsp.buf.definition, opts "Goto Definition")
        -- TODO keep using telescope?
        map("n", "gr", require("telescope.builtin").lsp_references, opts "Goto References")
        map("n", "gI", vim.lsp.buf.implementation, opts "Goto Implementation")
        map("n", "gy", vim.lsp.buf.type_definition, opts "Type definition")
        map("n", "K", vim.lsp.buf.hover, opts "Hover Documentation")
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
        -- TODO keep looking lazyvim mappings
        map("n", "<leader>lr", vim.lsp.buf.rename, opts "Rename symbol")
        map("n", "<leader>ls", require("telescope.builtin").lsp_document_symbols, opts "Document symbols")
      end

      ---- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      --local capabilities = vim.lsp.protocol.make_client_capabilities()
      --capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      require("lspconfig")["bashls"].setup({})
      require("lspconfig")["clangd"].setup({})
      require("lspconfig")["cmake"].setup({})
      require("lspconfig")["jsonls"].setup({})
      require("lspconfig")["taplo"].setup({})
      ---- Rust
      --require("lspconfig")["rust_analyzer"].setup({
      --    on_attach = on_attach,
      --    capabilities = capabilities,
      --    settings = {
      --        ["rust_analyzer"] = {
      --            checkOnSave = {
      --                allFeatures = true,
      --                overrideCommand = {
      --                    "cargo",
      --                    "clippy",
      --                    "--workspace",
      --                    "--all-targets",
      --                    "--all-features",
      --                },
      --            },
      --        },
      --    },
      --})
      -- Lua
      require("lspconfig")["lua_ls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,

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
    end,
  },
}
