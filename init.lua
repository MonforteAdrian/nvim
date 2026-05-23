-- Options are loaded before lazy.nvim so plugins see the intended defaults.
require("core.options")

-- Handle plugins with lazy.nvim.
require("core.lazy")

-- Colorscheme setup depends on plugins being available.
require("core.colorscheme")

-- Autocommands are loaded immediately so filetype/buffer events are not missed.
require("core.autocmds")

-- Global keymaps can be deferred until startup settles.
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("core.keymaps")
  end,
})
