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
        -- 2.x: auto-enables installed servers via vim.lsp.enable() — no manual calls needed.
        automatic_enable = true,
      })

      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb", "stylua", "shfmt" },
        automatic_installation = true,
      })
      -- Turn on LSP status information
      require("fidget").setup()

      -- Wire blink.cmp's enhanced LSP capabilities into every server.
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      -- Diagnostic config (signs + virtual_text + float)
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
        virtual_text = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          source = true,
          header = "",
          prefix = "",
        },
      })

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
          map("n", "gr", vim.lsp.buf.references, { desc = "References" })
          map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
          map("n", "gy", vim.lsp.buf.type_definition, { desc = "Type definition" })
          map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
          map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
          map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })
          if client:supports_method("textDocument/codeLens") then
            map({ "n", "x" }, "<leader>cc", vim.lsp.codelens.run, { buffer = bufnr, desc = "Run Codelens" })
          end

          local filetype = vim.bo[bufnr].filetype
          if disable_semantic_tokens[filetype] then
            client.server_capabilities.semanticTokensProvider = nil
          end
        end,
      })

      -- bashls / clangd / cmake / jsonls / taplo are auto-enabled by mason-lspconfig 2.x.
      -- Only servers needing custom settings stay below.

      -- Lua: lazydev.nvim handles workspace.library + globals dynamically,
      -- so the per-server config is intentionally minimal here.
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
          },
        },
      })
    end,
  },
}
