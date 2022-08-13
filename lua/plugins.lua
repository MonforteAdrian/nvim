local packer = require "packer"

packer.init {
  displays = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Dracula
  use '/home/adrian/.config/nvim/colorschemes/draculanvim'

  -- Dependencies
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- NeoGit
  use 'TimUntersberger/neogit'

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    'nvim-lua/lsp_extensions.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('lsp_extensions').setup()
    end
  }
  use 'glepnir/lspsaga.nvim'
  use { 'folke/trouble.nvim',
    config = function()
      require('trouble').setup()
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
  use "ravenxrz/DAPInstall.nvim"
  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- rust-tools
  use 'simrat39/rust-tools.nvim'
  use { 'saecki/crates.nvim',
    tag = 'v0.2.1',
    config = function()
        require('crates').setup()
    end
  }
  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- LuaLine
  use 'nvim-lualine/lualine.nvim'
  -- TabLine
  use 'kdheepak/tabline.nvim'

  -- Nvim-tree
  use 'kyazdani42/nvim-tree.lua'
  -- ToggleTerm
  use 'akinsho/toggleterm.nvim'
  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- Projects management
  use 'ahmedkhalf/project.nvim'

  -- Dashboard
  use 'glepnir/dashboard-nvim'
  --
  use 'nvim-neorg/neorg'
  -- VimWiki
  use 'vimwiki/vimwiki'

  -- Utilities
  use 'famiu/bufdelete.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'lewis6991/impatient.nvim'
  use 'windwp/nvim-autopairs' 
  Config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  }
end)
