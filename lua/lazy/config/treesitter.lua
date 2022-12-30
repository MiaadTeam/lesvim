-- Description : Nvim Treesitter configurations and abstraction layer
-- Link : https://github.com/nvim-treesitter/nvim-treesitter

local M = {
  "nvim-treesitter/nvim-treesitter",
  build= ":TSUpdate",
  config = function()
    require("packer.settings.treesitter")
  end,
}

return M
