-- Miscelaneous
return {
    -- crates rust
    {
        "saecki/crates.nvim",
        tag = "stable",
        config = function()
            require("crates").setup()
        end,
    },
    -- neorg dependency
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
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
