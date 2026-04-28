-- nvim-treesitter `main` branch (rewrite, required for Neovim 0.12+).
-- Requires `tree-sitter-cli` (>= 0.26.1) and a C compiler available in $PATH.
-- The old `master` branch API (require("nvim-treesitter.configs").setup{...})
-- no longer applies; highlight/fold/indent must be enabled per-buffer.

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

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false, -- main branch does not support lazy-loading
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    require("nvim-treesitter").install(ensure_installed)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
      callback = function(args)
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
      end,
    })
  end,
}
