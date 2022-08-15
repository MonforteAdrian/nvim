require('neorg').setup{
  load = {
    ["core.defaults"] = {},

    ["core.norg.qol.toc"] = {},
    ["core.norg.concealer"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.integrations.nvim-cmp"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          wiki = "~/wiki", -- Format: <name_of_workspace> = <path_to_workspace_root>
          neorg_test = "~/test"
        },
        autochdir = true, -- Automatically change the directory to the current workspace's root every time
        index = "index.norg", -- The name of the main (root) .norg file
      }
    }
  }
}
