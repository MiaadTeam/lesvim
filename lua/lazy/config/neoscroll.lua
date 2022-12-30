-- Description : Smooth scrolling neovim plugin written in lua
-- Link : https://github.com/karb94/neoscroll.nvim

local M = {
  "karb94/neoscroll.nvim",
  config = function()
    require("neoscroll").setup()
  end,
}

return M
