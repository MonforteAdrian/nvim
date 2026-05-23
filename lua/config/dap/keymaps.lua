local M = {}

function M.setup(dap)
  local map = require("core.util").map

  map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: toggle breakpoint" })
  map("n", "<leader>dC", dap.run_to_cursor, { desc = "DAP: run to cursor" })
  map("n", "<leader>du", function()
    require("dapui").toggle({})
  end, { desc = "DAP: toggle UI" })
  map("n", "<leader>de", function()
    require("dapui").eval()
  end, { desc = "DAP: eval variable under cursor" })
  map("n", "<leader>dD", function()
    require("dapui").toggle({ layout = 4, reset = true })
  end, { desc = "DAP: toggle disassembly" })

  map("n", "<F1>", dap.continue, { desc = "DAP: continue" })
  map("n", "<F2>", dap.step_into, { desc = "DAP: step into" })
  map("n", "<F3>", dap.step_over, { desc = "DAP: step over" })
  map("n", "<F4>", dap.step_out, { desc = "DAP: step out" })
  map("n", "<F5>", dap.step_back, { desc = "DAP: step back" })
  map("n", "<F9>", dap.restart, { desc = "DAP: restart" })
end

return M
