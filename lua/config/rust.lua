local M = {}

function M.rustaceanvim()
  vim.g.rustaceanvim = {
    tools = {},
    server = {
      on_attach = function(client, bufnr) end,
      default_settings = {
        ["rust-analyzer"] = {},
      },
    },
    dap = {},
  }
end

function M.neotest_opts()
  return {
    adapters = {
      require("rustaceanvim.neotest"),
    },
  }
end

return M
