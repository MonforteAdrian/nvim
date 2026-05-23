local M = {}

local icons = require("core.icons")
local map = vim.keymap.set

local function setup_mason()
  require("mason").setup({
    ui = {
      -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      border = "none",
      icons = {
        package_installed = icons.mason.installed,
        package_pending = icons.mason.pending,
        package_uninstalled = icons.mason.uninstalled,
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
    -- 2.x: auto-enables installed servers via vim.lsp.enable(); no manual calls needed.
    automatic_enable = true,
  })

  require("mason-nvim-dap").setup({
    ensure_installed = { "codelldb", "stylua", "shfmt" },
    automatic_installation = true,
  })
end

local function setup_diagnostics()
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.signs.error,
        [vim.diagnostic.severity.WARN] = icons.diagnostics.signs.warn,
        [vim.diagnostic.severity.HINT] = icons.diagnostics.signs.hint,
        [vim.diagnostic.severity.INFO] = icons.diagnostics.signs.info,
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
end

local function setup_lsp_attach()
  local disable_semantic_tokens = {
    lua = true,
  }

  vim.api.nvim_create_autocmd("LspAttach", {
    group = require("core.util").augroup("lsp_attach"),
    callback = function(args)
      local bufnr = args.buf
      local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")
      local function opts(desc)
        return { buffer = bufnr, desc = desc }
      end

      map("n", "gD", vim.lsp.buf.declaration, opts("Goto Declaration"))
      map("n", "gd", vim.lsp.buf.definition, opts("Goto Definition"))
      map("n", "gr", vim.lsp.buf.references, opts("References"))
      map("n", "gI", vim.lsp.buf.implementation, opts("Goto Implementation"))
      map("n", "gy", vim.lsp.buf.type_definition, opts("Type definition"))
      map("n", "K", vim.lsp.buf.hover, opts("Hover Documentation"))
      map("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
      map("n", "<leader>cr", vim.lsp.buf.rename, opts("Rename symbol"))
      if client:supports_method("textDocument/codeLens") then
        map({ "n", "x" }, "<leader>cc", vim.lsp.codelens.run, opts("Run Codelens"))
      end

      local filetype = vim.bo[bufnr].filetype
      if disable_semantic_tokens[filetype] then
        client.server_capabilities.semanticTokensProvider = nil
      end
    end,
  })
end

local function setup_servers()
  -- Wire blink.cmp's enhanced LSP capabilities into every server.
  vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
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
end

function M.setup()
  setup_mason()
  require("fidget").setup({})
  setup_servers()
  setup_diagnostics()
  setup_lsp_attach()
end

return M
