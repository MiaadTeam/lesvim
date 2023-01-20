-- Description :  Rearrange your windows with ease.
-- Link : https://github.com/sindrets/winshift.nvim

local M = {
  "sindrets/winshift.nvim",
  config = function()
    require("lazy.settings.winshift")
  end,
}

return M
