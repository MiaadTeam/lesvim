-- Description : A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
-- Link : https://github.com/norcalli/nvim-colorizer.lua

local M = {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup()
  end,
}

return M
