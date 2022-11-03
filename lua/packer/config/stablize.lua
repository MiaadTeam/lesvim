-- Description : Neovim plugin to stabilize window open/close events.
-- Link : https://github.com/luukvbaal/stabilize.nvim

local M = {
  "luukvbaal/stabilize.nvim",
  config = function()
    require("stabilize").setup()
  end,
}

return M
