local M = {}

function M.augroup(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

function M.map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
