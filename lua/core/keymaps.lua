local map = vim.keymap.set

-- lazy
map("n", "<leader>L", "<cmd>Lazy<cr>")

-- change focus window
map("n", "<leader>h", "<C-w>h", { desc = "switch window left" })
map("n", "<leader>j", "<C-w>j", { desc = "switch window down" })
map("n", "<leader>k", "<C-w>k", { desc = "switch window up" })
map("n", "<leader>l", "<C-w>l", { desc = "switch window right" })

-- lsp format
map("n", "<leader>fm", function()
    vim.cmd('lua vim.lsp.buf.format() ')
end, { desc = "Format" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
