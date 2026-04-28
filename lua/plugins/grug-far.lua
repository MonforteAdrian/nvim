return {
  {
    "MagicDuck/grug-far.nvim",
    cmd = { "GrugFar", "GrugFarWithin" },
    keys = {
      { "<leader>fr", "<cmd>GrugFar<cr>", desc = "Find & Replace (project)" },
      { "<leader>fr", "<cmd>GrugFarWithin<cr>", mode = "v", desc = "Find & Replace (selection)" },
    },
    opts = {
      windowCreationCommand = "botright split | resize 16",
    },
  },
}
