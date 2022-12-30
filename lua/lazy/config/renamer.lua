-- Description : VS Code-like renaming UI for Neovim, writen in Lua.
-- Link : https://github.com/filipdutescu/renamer.nvim

local M = {
  "filipdutescu/renamer.nvim",
  branch = "master",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("packer.settings.renamer")
  end,
}

return M
