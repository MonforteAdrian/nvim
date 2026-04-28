local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd
local opt_local = vim.opt_local

-- resize splits if window got resized
autocmd({ "VimResized" }, {
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    cmd("tabdo wincmd =")
    cmd("tabnext " .. current_tab)
  end,
})

-- wrap and check for spell in text filetypes
autocmd("FileType", {
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown", "norg" },
  callback = function()
    opt_local.wrap = true
    opt_local.spell = true
  end,
})

-- No comments on new line
autocmd({ "BufNewFile", "BufRead" }, {
  callback = function()
    cmd("setlocal formatoptions-=cro")
  end,
})

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end,
})
