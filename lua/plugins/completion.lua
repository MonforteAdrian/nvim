--return {
--    {
--        "hrsh7th/nvim-cmp",
--        event = "InsertEnter",
--        dependencies = {
--            "hrsh7th/cmp-nvim-lsp",
--            "hrsh7th/cmp-nvim-lua",
--            "hrsh7th/cmp-buffer",
--            "hrsh7th/cmp-path",
--            "hrsh7th/cmp-cmdline",
--            "L3MON4D3/LuaSnip",
--            "saadparwaiz1/cmp_luasnip",
--            "rafamadriz/friendly-snippets",
--        },
--        config = function()
--            local cmp = require("cmp")
--            local luasnip = require("luasnip")
--
--            require("luasnip/loaders/from_vscode").lazy_load()
--
--            cmp.setup({
--                snippet = {
--                    -- REQUIRED - you must specify a snippet engine
--                    expand = function(args)
--                        luasnip.lsp_expand(args.body) -- For `luasnip` users.
--                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
--                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--                    end,
--                },
--                window = {
--                    -- completion = cmp.config.window.bordered(),
--                    -- documentation = cmp.config.window.bordered(),
--                },
--                mapping = cmp.mapping.preset.insert({
--                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
--                    ["<C-Space>"] = cmp.mapping.complete(),
--                    ["<C-e>"] = cmp.mapping.abort(),
--                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--                    ["<Tab>"] = cmp.mapping(function(fallback)
--                        if cmp.visible() then
--                            cmp.select_next_item()
--                        elseif luasnip.expand_or_jumpable() then
--                            luasnip.expand_or_jump()
--                        else
--                            fallback()
--                        end
--                    end, { "i", "s" }),
--                }),
--                sources = cmp.config.sources({
--                    { name = "nvim_lsp" },
--                    { name = "luasnip" }, -- For luasnip users.
--                    -- { name = 'vsnip' }, -- For vsnip users.
--                    -- { name = 'ultisnips' }, -- For ultisnips users.
--                    -- { name = 'snippy' }, -- For snippy users.
--                    { name = "path" },
--                    { name = "buffer" },
--                }),
--            })
--
--            -- Set configuration for specific filetype.
--            cmp.setup.filetype("gitcommit", {
--                sources = cmp.config.sources({
--                    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
--                }, {
--                    { name = "buffer" },
--                }),
--            })
--
--            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--            cmp.setup.cmdline({ "/", "?" }, {
--                mapping = cmp.mapping.preset.cmdline(),
--                sources = {
--                    { name = "buffer" },
--                },
--            })
--
--            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--            cmp.setup.cmdline(":", {
--                mapping = cmp.mapping.preset.cmdline(),
--                sources = cmp.config.sources({
--                    { name = "path" },
--                }, {
--                    { name = "cmdline" },
--                }),
--            })
--        end,
--    },
--}
return {
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        priority = 100,
        dependencies = {
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            vim.opt.completeopt = { "menu", "menuone", "noselect" }
            vim.opt.shortmess:append("c")

            local lspkind = require("lspkind")
            lspkind.init({})

            local cmp = require("cmp")

            cmp.setup({
                sources = {
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "buffer" },
                },
                mapping = {
                    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-y>"] = cmp.mapping(
                        cmp.mapping.confirm({
                            behavior = cmp.ConfirmBehavior.Insert,
                            select = true,
                        }),
                        { "i", "c" }
                    ),
                },

                -- Enable luasnip to handle snippet expansion for nvim-cmp
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
            })

            local ls = require("luasnip")
            ls.config.set_config({
                history = false,
                updateevents = "TextChanged,TextChangedI",
            })

            for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
                loadfile(ft_path)()
            end

            vim.keymap.set({ "i", "s" }, "<c-k>", function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<c-j>", function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end, { silent = true })
        end,
    },
}
