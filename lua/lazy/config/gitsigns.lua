-- Description : Super fast git decorations implemented purely in lua/teal.
-- Link : https://github.com/lewis6991/gitsigns.nvim

local M = {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("gitsigns").setup()
  end,
}

return M
