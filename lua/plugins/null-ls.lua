return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            debug = false,
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end
            end,
            sources = {
                formatting.prettier.with({
                    extra_filetypes = { "toml" },
                    extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
                }),
                formatting.black.with({ extra_args = { "--fast" } }),
                formatting.stylua,
                diagnostics.write_good,
                null_ls.builtins.formatting.rustfmt.with({
                    extra_args = function(params)
                        local Path = require("plenary.path")
                        local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

                        if cargo_toml:exists() and cargo_toml:is_file() then
                            for _, line in ipairs(cargo_toml:readlines()) do
                                local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
                                if edition then
                                    return { "--edition=" .. edition }
                                end
                            end
                        end
                        -- default edition when we don't find `Cargo.toml` or the `edition` in it.
                        return { "--edition=2021" }
                    end,
                }),
                --diagnostics.flake8,
            },
        })
    end,
}
