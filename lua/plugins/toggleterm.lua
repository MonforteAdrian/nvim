-- TODO fix terminal
return {
    "akinsho/toggleterm.nvim",
    keys = {
        { "<leader>t", "<cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
        { "<leader>t", "<Esc> && :q",         mode = "t" },
        { "<leader>k", "<C-\\><C-N><C-w>k",   mode = "t" },
    },
    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<c-\>]],
            hide_numbers = true, -- hide the number column in toggleterm buffers
            shade_filetypes = {},
            highlights = {
                Normal = {
                    guibg = "none",
                },
            },
            shade_terminals = true,
            shading_factor = 1,       -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
            start_in_insert = true,
            insert_mappings = true,   -- whether or not the open mapping applies in insert mode
            terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
            persist_size = true,
            direction = "horizontal",
            close_on_exit = true, -- close the terminal window when the process exits
            shell = vim.o.shell,  -- change the default shell
            -- This field is only relevant if direction is set to 'float'
            float_opts = { border = "rounded", winblend = 3 },
        })
    end,
}
