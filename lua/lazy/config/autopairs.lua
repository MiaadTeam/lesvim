-- Description :  A super powerful autopair plugin for Neovim that supports multiple characters.
-- Link : https://github.com/windwp/nvim-autopairs

local M = {
  "windwp/nvim-autopairs",
  config = function()
    require("lazy.settings.autopairs")
  end,
}

return M
