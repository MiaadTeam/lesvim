-- Description : Escape from insert mode without delay when typing
-- Link : https://github.com/max397574/better-escape.nvim

local M = {
  "max397574/better-escape.nvim",
  config = function()
    require("packer.settings.escape")
  end,
}

return M
