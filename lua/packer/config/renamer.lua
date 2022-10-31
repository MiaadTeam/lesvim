local M = {
  "filipdutescu/renamer.nvim",
  branch = "master",
  requires = { { "nvim-lua/plenary.nvim" } },
  config = function()
    require("packer.settings.renamer")
  end,
}

return M
