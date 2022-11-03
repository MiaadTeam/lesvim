-- Description : 🌅 Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing using TreeSitter.
-- Link : https://github.com/folke/twilight.nvim

local M = {
  "folke/twilight.nvim",
  config = function()
    require("twilight").setup({})
  end,
}

return M
