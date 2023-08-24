return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "j-hui/fidget.nvim",
                tag = "legacy",
                event = "LspAttach",
                opts = {
                    -- options
                },
            },
            "folke/neodev.nvim",
            "hrsh7th/cmp-nvim-lsp",
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

            -- Quick access via keymap
            require("helpers.keys").map("n", "<leader>M", "<cmd>Mason<cr>", "Show Mason")

            -- Neodev setup before LSP config
            require("neodev").setup()

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
                local lsp_map = require("helpers.keys").lsp_map

                lsp_map("<leader>lr", vim.lsp.buf.rename, bufnr, "Rename symbol")
                lsp_map("<leader>la", vim.lsp.buf.code_action, bufnr, "Code action")
                lsp_map("<leader>ld", vim.lsp.buf.type_definition, bufnr, "Type definition")
                lsp_map("<leader>ls", require("telescope.builtin").lsp_document_symbols, bufnr, "Document symbols")

                lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
                lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
                lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
                lsp_map("K", vim.lsp.buf.hover, bufnr, "Hover Documentation")
                lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")

                -- Create a command `:Format` local to the LSP buffer
                vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
                    vim.lsp.buf.format()
                end, { desc = "Format current buffer with LSP" })
            end

            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            -- Rust
            require("lspconfig")["rust_analyzer"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    ["rust_analyzer"] = {
                        checkOnSave = {
                            allFeatures = true,
                            overrideCommand = {
                                "cargo",
                                "clippy",
                                "--workspace",
                                "--all-targets",
                                "--all-features",
                            },
                        },
                    },
                },
            })

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
