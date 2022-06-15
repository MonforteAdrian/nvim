local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Nvim
map('i', 'ii', '<Esc>')                                     -- ii insert to espcape

map('n', '<leader>h', '<C-w>h')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')
map('n', '<leader>l', '<C-w>l')

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>')                -- Toggle NvimTree

-- ToggleTerm
map('n', '<leader>t', ':ToggleTerm<CR>')                    -- Open new terminal
map('t', '<leader>t', '<Esc> && :q')                        -- Closes the terminal
map('t', '<leader>k', '<C-\\><C-N><C-w>k')

-- Tabline
map('n', '<leader>n', ':TablineBufferNext<CR>')          -- Next buffer

-- Telescope
map('n', '<leader>ff', ':Telescope find_files hidden=true<CR>')
map('n', '<leader>fi', ':Telescope media_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers hidden=true<CR>')
map('n', '<leader>fh', ':Telescope help_tags hidden=true<CR>')
map('n', '<leader>gs', ':Telescope git_status hidden=true<CR>')
