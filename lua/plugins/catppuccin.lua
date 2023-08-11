return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            local catppuccin = require("catppuccin")

            local telescopeBorderless = function(colors)
                return {
                    TelescopeNormal = { bg = colors.crust },
                    TelescopeBorder = { fg = colors.crust, bg = colors.crust },

                    TelescopeMatching = { fg = colors.blue },

                    TelescopeSelection = { fg = colors.flamingo, bg = colors.mantle },
                    TelescopeSelectionCaret = { fg = colors.flamingo },
                    TelescopeResultsDiffAdd = { fg = colors.green },
                    TelescopeResultsDiffChange = { fg = colors.yellow },
                    TelescopeResultsDiffDelete = { fg = colors.red },

                    TelescopeTitle = { fg = colors.crust, bg = colors.green },
                    TelescopePreviewTitle = { fg = colors.base, bg = colors.green },

                    TelescopePromptPrefix = { fg = colors.red, bg = colors.mantle },
                    TelescopePromptTitle = { fg = colors.base, bg = colors.red },
                    TelescopePromptNormal = { fg = colors.text, bg = colors.mantle },
                    TelescopePromptBorder = { fg = colors.mantle, bg = colors.mantle },
                    TelescopeResultsTitle = { fg = colors.crust, bg = colors.crust },
                }
            end

            local latte = require("catppuccin.palettes").get_palette "latte"
            local frappe = require("catppuccin.palettes").get_palette "frappe"
            local macchiato = require("catppuccin.palettes").get_palette "macchiato"
            local mocha = require("catppuccin.palettes").get_palette "mocha"

            catppuccin.setup({
                flavour = "macchiato", -- latte, frappe, macchiato, mocha
                background = {
                                       -- :h background
                    light = "latte",
                    dark = "macchiato",
                },
                transparent_background = false,
                show_end_of_buffer = false, -- show the '~' characters after the end of buffers
                term_colors = false,
                dim_inactive = {
                    enabled = false,
                    shade = "dark",
                    percentage = 0.15,
                },
                no_italic = false, -- Force no italic
                no_bold = false,   -- Force no bold
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                },
                color_overrides = {},
                custom_highlights = {},
                highlight_overrides = {
                    latte = telescopeBorderless(latte),
                    frappe = telescopeBorderless(frappe),
                    macchiato = telescopeBorderless(macchiato),
                    mocha = telescopeBorderless(mocha),
                },
                integrations = {
                    cmp = true,
                    dashboard = true,
                    gitsigns = true,
                    mason = true,
                    neogit = true,
                    nvimtree = true,
                    telescope = true,
                },
            })
        end,
    },
}
