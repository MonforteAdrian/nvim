local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- colorschemes
    use { "catppuccin/nvim", as = "catppuccin" }
    use '/home/adrian/.config/nvim/colorschemes/draculanvim'
    use({ 'monsonjeremy/onedark.nvim', branch = 'treesitter' })
    --use 'navarasu/onedark.nvim'
    use 'NTBBloodbath/doom-one.nvim'

    -- Dependencies
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- NeoGit
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
    use 'TimUntersberger/neogit'

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        { 'williamboman/mason.nvim', run = ":MasonUpdate" },
        'williamboman/mason-lspconfig.nvim',
        'nvim-lua/lsp_extensions.nvim',
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('lsp_extensions').setup()
        end
    }
    -- Completion
    use {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp'
    }
    -- Dap
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'
    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'
    -- rust-tools
    use 'simrat39/rust-tools.nvim'
    use { 'saecki/crates.nvim',
        config = function()
            require('crates').setup()
        end
    }
    -- snippets
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- LuaLine
    use 'nvim-lualine/lualine.nvim'

    -- Nvim-tree
    use 'kyazdani42/nvim-tree.lua'
    -- ToggleTerm
    use 'akinsho/toggleterm.nvim'
    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Dashboard
    use 'glepnir/dashboard-nvim'
    -- Neorg
    use { 'nvim-neorg/neorg', run = ":Neorg sync-parsers" }
    -- VimWiki
    use 'vimwiki/vimwiki'

    -- Utilities
    use {
        'folke/which-key.nvim',
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use 'famiu/bufdelete.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'lewis6991/impatient.nvim'
    use { "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
