-- Description :  A super powerful autopair plugin for Neovim that supports multiple characters.
-- Link : https://github.com/windwp/nvim-autopairs

local M = {
  "hrsh7th/nvim-insx",
  config = function()
    require("insx.preset.standard").setup()
  end,
}

return M
