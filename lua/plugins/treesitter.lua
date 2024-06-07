return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/playground",
    },
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "cpp",
                "rust",
                "cmake",
                "fish",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "json",
                "make",
                "norg",
                "proto",
                "python",
                "regex",
                "toml",
                "diff",
                "ungrammar",
            },
            sync_install = false,
            auto_install = true,
            ignore_install = { "" }, -- List of parsers to ignore installing
            highlight = {
                enable = true,       -- false will disable the whole extension
                disable = { "" },    -- list of language that will be disabled
                additional_vim_regex_highlighting = true,
            },
            indent = { enable = true },
            playground = {
                enable = true,
                disable = {},
                updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false, -- Whether the query persists across vim sessions
                keybindings = {
                    toggle_query_editor = "o",
                    toggle_hl_groups = "i",
                    toggle_injected_languages = "t",
                    toggle_anonymous_nodes = "a",
                    toggle_language_display = "I",
                    focus_language = "f",
                    unfocus_language = "F",
                    update = "R",
                    goto_node = "<cr>",
                    show_help = "?",
                },
            },
        })
    end,
}
