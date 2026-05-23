-- Miscelaneous
return {
  -- neorg dependency
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  -- Utilites
  {
    "NvChad/nvim-colorizer.lua",
    main = "colorizer",
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    opts = {},
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      formatters_by_ft = {
        markdown = { "prettierd", "prettier", stop_after_first = true },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
  {
    "fei6409/log-highlight.nvim",
    opts = {},
  },
  -- markdown viewer
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    opts = {
      file_types = { "markdown", "copilot-chat" },
    },
  },
  -- Mermaid diagram viewer using web browser
  {
    "selimacerbas/markdown-preview.nvim",
    dependencies = { "selimacerbas/live-server.nvim" },
    main = "markdown_preview",
    opts = {
      -- all optional; sane defaults shown
      instance_mode = "takeover", -- "takeover" (one tab) or "multi" (tab per instance)
      port = 0, -- 0 = auto (8421 for takeover, OS-assigned for multi)
      open_browser = true,
      debounce_ms = 300,
    },
  },
}
