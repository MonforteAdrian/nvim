local M = {}

local function append_log(message)
  local file = io.open("probe-rs.log", "a")
  if file then
    file:write(message)
    file:close()
  end
end

function M.setup(dap)
  if not dap.adapters then
    dap.adapters = {}
  end

  dap.adapters["probe-rs-debug"] = {
    type = "server",
    port = "${port}",
    executable = {
      command = vim.fn.expand("$HOME/.cargo/bin/probe-rs"),
      args = { "dap-server", "--port", "${port}" },
    },
  }

  -- Project-specific probe-rs debug configuration lives in .vscode/launch.json.
  require("dap.ext.vscode").type_to_filetypes["probe-rs-debug"] = { "rust" }

  dap.listeners.before["event_probe-rs-rtt-channel-config"]["plugins.nvim-dap-probe-rs"] = function(session, body)
    local message = string.format(
      '%s: Opening RTT channel %d with name "%s"!\n',
      os.date("%Y-%m-%d-T%H:%M:%S"),
      body.channelNumber,
      body.channelName
    )

    require("dap.utils").notify(
      string.format('probe-rs: Opening RTT channel %d with name "%s"!', body.channelNumber, body.channelName)
    )
    append_log(message)
    session:request("rttWindowOpened", { body.channelNumber, true })
  end

  dap.listeners.before["event_probe-rs-rtt-data"]["plugins.nvim-dap-probe-rs"] = function(_, body)
    local message =
      string.format("%s: RTT-Channel %d - Message: %s", os.date("%Y-%m-%d-T%H:%M:%S"), body.channelNumber, body.data)
    require("dap.repl").append(message)
    append_log(message)
  end

  dap.listeners.before["event_probe-rs-show-message"]["plugins.nvim-dap-probe-rs"] = function(_, body)
    local message = string.format("%s: probe-rs message: %s", os.date("%Y-%m-%d-T%H:%M:%S"), body.message)
    require("dap.repl").append(message)
    append_log(message)
  end
end

return M
