-- Description : A file explorer tree for neovim written in lua
-- Link : https://github.com/kyazdani42/nvim-tree.lua

local M = {
  "kyazdani42/nvim-tree.lua",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function()
    require("lazy.settings.tree")
  end,
}

return M
