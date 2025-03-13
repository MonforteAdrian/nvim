return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-media-files.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files hidden=true <CR>",                 desc = "Find files" },
        { "<leader>fi", "<cmd>Telescope media_files<CR>",                             desc = "Media files" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>",                               desc = "Live grep" },
        { "<leader>fc", "<cmd>Telescope grep_string<CR>",                             desc = "Grep under cursor" },
        { "<leader>fb", "<cmd>Telescope buffers hidden=true initial_mode=normal<CR>", desc = "Buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags hidden=true<CR>",                   desc = "Help tags" },
        --{ "<leader>fm", "<cmd>Telescope man_pages<CR>",                               desc = "Man pages" },
        { "<leader>fs", "<cmd>Telescope spell_suggest<CR>",                           desc = "Spell suggest" },
        { "<leader>gs", "<cmd>Telescope git_status hidden=true<CR>",                  desc = "Git status" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local sorters = require("telescope.sorters")

        telescope.setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "-L",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--trim", -- add this value
                },
                prompt_prefix = "   ",
                selection_caret = "  ",
                entry_prefix = "  ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                file_sorter = sorters.get_fuzzy_file,
                file_ignore_patterns = {
                    "target",
                    "qmk_firmware",
                    ".mozilla",
                    ".git",
                    ".local",
                    "wallpapers",
                    ".cache",
                },
                generic_sorter = sorters.get_generic_fuzzy_sorter,
                path_display = { "truncate" },
                winblend = 0,
                border = {},
                color_devicons = true,
                set_env = { ["COLORTERM"] = "truecolor" },
                mappings = {
                    i = {
                        [":q<Cr>"] = actions.close,
                    },
                },
            },
            pickers = {
                sorter = sorters.get_generic_fuzzy_sorter(),
                find_files = {
                    --find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
                    file_ignore_patterns = { "png", "webp", "jpg", "jpeg", "mp4", "gif" },
                },
                buffers = {
                    sort_lastused = true,
                    mappings = {
                        n = {
                            ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
                        },
                        i = {
                            ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
                        },
                    },
                },
            },
            extensions = {
                media_files = {
                    -- filetypes whitelist
                    -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                    filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "gif" },
                    find_cmd = "rg", -- find command (defaults to `fd`)
                },
            },
        })

        --telescope.load_extension("dap")
        telescope.load_extension("media_files")
    end,
}
