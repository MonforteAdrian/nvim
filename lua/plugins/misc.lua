-- Miscelaneous
return {
    -- Utilites
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({})
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
}
