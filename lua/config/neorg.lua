require('neorg').setup{
  load = {
    ["core.defaults"] = {},

    ["core.norg.qol.toc"] = {},
    ["core.gtd.base"] = {
      config = {
        workspace = "gtd",
      },
    },
    ["core.gtd.helpers"] = {},
    ["core.gtd.ui"] = {},
    ["core.gtd.queries"] = {},

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
          neorg_test = "~/test",
          gtd = "~/gtd",
        },
        autochdir = true, -- Automatically change the directory to the current workspace's root every time
        index = "index.norg", -- The name of the main (root) .norg file
      }
    }
  }
}
