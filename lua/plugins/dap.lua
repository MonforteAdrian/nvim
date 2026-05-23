return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      { url = "https://codeberg.org/Jorenar/nvim-dap-disasm.git" },
    },
    config = function()
      local dap = require("dap")

      require("config.dap.ui").setup(dap)
      require("nvim-dap-virtual-text").setup({})
      require("config.dap.keymaps").setup(dap)
      require("config.dap.probe_rs").setup(dap)
    end,
  },
}
