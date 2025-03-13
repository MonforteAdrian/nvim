local cmd = vim.cmd
local indent = 4

cmd("syntax enable")
cmd("filetype plugin indent on")

local opts = {
    backup = false,            -- Set automatic backup in false
    clipboard = "unnamedplus", -- Allow clipboard from outside of vim
    cursorline = true,         -- Show the line you are currently
    expandtab = true,          -- Use spaces instead of tabs
    foldlevel = 7,             -- Fold between {{{ and }}}
    foldmethod = "marker",     -- Fold between {{{ and }}}
    formatoptions = "t",
    hidden = true,             -- Enable background buffers
    ignorecase = true,         -- Ignore case
    list = true,               -- Show some invisible characters
    mouse = "a",               -- Enable mouse use
    number = true,             -- Show line numbers
    relativenumber = true,     -- Relative line numbers
    scrolloff = 4,             -- Lines of context
    shiftround = true,         -- Round indent
    shiftwidth = indent,       -- Size of an indent
    sidescrolloff = 8,         -- Columns of context
    signcolumn = "yes",        -- Shows sign column always
    smartcase = true,          -- Do not ignore case with capitals
    smartindent = true,        -- Insert indents automatically
    splitbelow = true,         -- Put new windows below current
    splitright = true,         -- Put new windows right of current
    tabstop = indent,          -- Number of spaces tabs count for
    termguicolors = true,      -- True color support
    timeoutlen = 500,          -- Time waiting for a command
    undofile = true,           -- Enable persistent undo
    updatetime = 300,          -- faster completion
    wildmenu = true,           -- Command-line completion mode
    wrap = false,              -- Disable line wrap
}

-- Set options from table
for opt, val in pairs(opts) do
    vim.o[opt] = val
end

-- Set other options
local colorscheme = require("helpers.colorscheme")
cmd.colorscheme(colorscheme)
