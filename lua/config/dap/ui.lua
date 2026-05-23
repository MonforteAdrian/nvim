local M = {}

local dapui_titles = {
  dapui_scopes = "  Scopes",
  dapui_breakpoints = "  Breakpoints",
  dapui_stacks = "  Stacks",
  dapui_watches = "  Watches",
  dapui_console = "  Console",
  dapui_disassembly = "  Disassembly",
}

local function apply_dapui_titles()
  vim.schedule(function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local ok, buf = pcall(vim.api.nvim_win_get_buf, win)
      if ok then
        local title = dapui_titles[vim.bo[buf].filetype]
        if title then
          pcall(vim.api.nvim_set_option_value, "winbar", "%#Title#" .. title .. "%*", { scope = "local", win = win })
        end
      end
    end
  end)
end

function M.setup(dap)
  local ui = require("dapui")

  -- Must be set up before dapui so the "disassembly" element is registered.
  require("dap-disasm").setup({
    dapui_register = true,
    winbar = { enabled = true },
    ins_before_memref = 16,
    ins_after_memref = 32,
    columns = { "address", "instruction" },
  })

  ui.setup({
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.375 },
          { id = "breakpoints", size = 0.125 },
          { id = "stacks", size = 0.25 },
          { id = "watches", size = 0.25 },
        },
        size = 50,
        position = "left",
      },
      {
        elements = {
          { id = "console", size = 1.0 },
        },
        size = 15,
        position = "bottom",
      },
      {
        elements = {
          { id = "repl", size = 1.0 },
        },
        size = 8,
        position = "bottom",
      },
      -- Disassembly layout. Because this layout is defined after the bottom
      -- layouts, it stops above console/repl instead of spanning full height.
      {
        elements = {
          { id = "disassembly", size = 1.0 },
        },
        size = 80,
        position = "right",
      },
    },
  })

  dap.listeners.before.attach.dapui_config = function()
    ui.open()
    apply_dapui_titles()
  end
  dap.listeners.before.launch.dapui_config = function()
    ui.open()
    apply_dapui_titles()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
  end
end

return M
