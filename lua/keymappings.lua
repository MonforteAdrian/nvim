local g = vim.g
g.mapleader = ' '

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

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

-- Telescope
map('n', '<leader>f', ':Telescope find_files hidden=true<CR>')
map('n', '<leader>fp', ':Telescope projects hidden=true initial_mode=normal<CR>')
map('n', '<leader>fi', ':Telescope media_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers hidden=true initial_mode=normal<CR>')
map('n', '<leader>fh', ':Telescope help_tags hidden=true<CR>')
map('n', '<leader>gs', ':Telescope git_status hidden=true<CR>')

-- Dap
map("n", "<Leader>dt", ':lua require"dapui".toggle()<CR>')
map("n", "<Leader>dc", ':lua require"dap".continue()<CR>')
map("n", "<Leader>dq", ':lua require"dap".terminate()<CR>')
map("n", "<Leader>dp", ':lua require"dap".toggle_breakpoint()<CR>')
map("n", "<F4>", ':lua require"dap".step_into()<CR>')
map("n", "<F5>", ':lua require"dap".step_over()<CR>')
map("n", "<F6>", ':lua require"dap".step_out()<CR>')
