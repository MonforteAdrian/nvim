-- TODO do or don't do this
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr, desc = "Code Action" }
)

vim.keymap.set(
  "n",
  "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({ 'hover', 'actions' })
  end,
  { silent = true, buffer = bufnr, desc = "Hover Documentation" }
)

vim.keymap.set(
  "n",
  "gD", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.lsp.buf.declaration()
  end,
  { silent = true, buffer = bufnr, desc = "Goto Declaration" }
)

vim.keymap.set(
  "n",
  "gd", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.lsp.buf.definition()
  end,
  { silent = true, buffer = bufnr, desc = "Goto Definition" }
)

vim.keymap.set(
  "n",
  "gr", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.lsp.buf.references()
  end,
  { silent = true, buffer = bufnr, desc = "Goto References" }
)

vim.keymap.set(
  "n",
  "gI", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.lsp.buf.implementation()
  end,
  { silent = true, buffer = bufnr, desc = "Goto Implementation" }
)

vim.keymap.set(
  "n",
  "gy", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.lsp.buf.type_definition()
  end,
  { silent = true, buffer = bufnr, desc = "Goto T[y]pe Definition" }
)

vim.keymap.set(
  "n",
  "gK", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.lsp.buf.signature_help()
  end,
  { silent = true, buffer = bufnr, desc = "Signature help" }
)

vim.keymap.set(
  "n",
  "<leader>rd",
  function()
    vim.cmd.RustLsp({ 'debuggables', bang = true })
  end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
  "n",
  "<leader>rr",
  function()
    vim.cmd.RustLsp({ 'runnables', bang = true })
  end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
  "n",
  "<leader>rt",
  function()
    vim.cmd.RustLsp({ 'testables' })
  end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
  "n",
  "<A-j>",
  function()
    vim.cmd.RustLsp({ 'moveItem', 'down' })
  end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
  "n",
  "<A-k>",
  function()
    vim.cmd.RustLsp({ 'moveItem', 'up' })
  end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
  "n",
  "<leader>re",
  function()
    vim.cmd.RustLsp({ 'renderDiagnostic' })
  end,
  { silent = true, buffer = bufnr }
)
