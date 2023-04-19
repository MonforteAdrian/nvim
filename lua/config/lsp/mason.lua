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
        "rust_analyzer",
        -- "cssls",
        -- "html",
        -- "tsserver",
        -- "pyright",
        -- "jsonls",
        -- "yamlls",
    },
    automatic_installation = true,
})
