-- Description :  This plugin adds indentation guides to all lines (including empty lines).
-- Link : https://github.com/lukas-reineke/indent-blankline.nvim

local M = {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("packer.settings.blankline")
  end,
}

return M
