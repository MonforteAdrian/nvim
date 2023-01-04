local cmd = vim.cmd
local opt = vim.opt
local indent = 4

cmd 'syntax enable'
--cmd 'colorscheme dracula'
cmd 'colorscheme onedark'
--cmd 'colorscheme doom-one'
cmd 'filetype plugin indent on'

opt.backup = false                  -- Set automatic backup in false
opt.clipboard = 'unnamedplus'       -- Allow clipboard from outside of vim
opt.cursorline = true               -- Show the line you are currently
opt.expandtab = true                -- Use spaces instead of tabs
opt.foldlevel = 7                   -- Fold between {{{ and }}}
opt.foldmethod = 'marker'           -- Fold between {{{ and }}}
opt.formatoptions = "t"
opt.hidden = true                   -- Enable background buffers
opt.ignorecase = true               -- Ignore case
opt.list = true                     -- Show some invisible characters
opt.mouse = 'a'                     -- Enable mouse use
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Relative line numbers
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.shiftwidth = indent             -- Size of an indent
opt.sidescrolloff = 8               -- Columns of context
opt.signcolumn = "yes"              -- Shows sign column always
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = indent                -- Number of spaces tabs count for
opt.termguicolors = true            -- True color support
opt.timeoutlen = 500                -- Time waiting for a command
opt.undofile = true                 -- Enable persistent undo
opt.updatetime = 300                -- faster completion
opt.wildmenu = true                 -- Command-line completion mode
opt.wrap = false                    -- Disable line wrap

opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
