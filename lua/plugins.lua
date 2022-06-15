require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Dracula
  --use 'dracula/vim'
  use '/home/adrian/.config/nvim/colorschemes/draculanvim'
  -- Icons required by lualine, tabline and nvim-tree
  use 'kyazdani42/nvim-web-devicons'
  -- PLenary required by Nvim-Tree and Neorg
  use 'nvim-lua/plenary.nvim'
  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer'
  }
  -- DAP
  use 'mfussenegger/nvim-dap'
  -- rust-tools
  use 'simrat39/rust-tools.nvim'
  -- cmp
  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp'
  }
  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- LuaLine
  use 'nvim-lualine/lualine.nvim'
  -- TabLine
  use 'kdheepak/tabline.nvim'
  -- Nvim-tree
  use 'kyazdani42/nvim-tree.lua'
  -- ToggleTerm
  use 'akinsho/toggleterm.nvim'
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-media-files.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    }
  }
  -- Dashboard
  use 'glepnir/dashboard-nvim'
  -- VimWiki
  use 'vimwiki/vimwiki'
  -- Bufdelete
  use 'famiu/bufdelete.nvim'
  -- nvim-colorized
  use 'norcalli/nvim-colorizer.lua'
  -- Impatient
  use 'lewis6991/impatient.nvim'
  Config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  }
end)
