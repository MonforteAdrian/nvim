require('neorg').setup{
  load = {
    ["core.defaults"] = {},
    ["core.integrations.telescope"] = {},
    ["core.norg.completion"] = {},
    ["core.integrations.nvim-cmp"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          my_ws = "~/wiki", -- Format: <name_of_workspace> = <path_to_workspace_root>
        },
        autochdir = true, -- Automatically change the directory to the current workspace's root every time
        index = "index.norg", -- The name of the main (root) .norg file
      }
    }
  }

}
