local M = {}

local ensure_installed = {
  "bash",
  "c",
  "cmake",
  "cpp",
  "diff",
  "fish",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "json",
  "lua",
  "make",
  "markdown",
  "markdown_inline",
  "proto",
  "python",
  "regex",
  "ron",
  "rust",
  "toml",
  "ungrammar",
  "vim",
  "vimdoc",
}

local function enable_for_buffer(args)
  local buf = args.buf
  local ft = vim.bo[buf].filetype
  local lang = vim.treesitter.language.get_lang(ft) or ft
  if not lang or lang == "" then
    return
  end
  if not pcall(vim.treesitter.start, buf, lang) then
    return
  end

  vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
  vim.wo[0][0].foldmethod = "expr"

  vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

function M.setup()
  require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
  })

  require("nvim-treesitter").install(ensure_installed)

  vim.api.nvim_create_autocmd("FileType", {
    group = require("core.util").augroup("treesitter"),
    callback = enable_for_buffer,
  })
end

return M
