---- Helpers
local fn = vim.fn
local g = vim.g
local cmd = vim.cmd
local execute = vim.api.nvim_command

-- Map leader to space
g.mapleader = ' '

local function sys_init()
  require ('impatient')
end

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Start loading
sys_init()
require "packer_compiled"
packer_init()
require "settings"
require "keymappings"
require "plugins"
require "config/cmp"
require "config/colorized"
require "config/dap"
require "config/dashboard"
require "config/lsp"
require "config/lualine"
require "config/neorg"
require "config/neogit"
require "config/nvimtree"
require "config/rust-tools"
require "config/tabline"
require "config/telescope"
require "config/toggleterm"
require "config/treesitter"
-- End loading
