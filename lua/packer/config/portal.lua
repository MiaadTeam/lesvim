-- Description : Look at you, sailing through the [jumplist] majestically, like an eagle... piloting a blimp.
-- Link : https://github.com/cbochs/portal.nvim

local M = {
  "cbochs/portal.nvim",
  config = function()
    require("portal").setup({
      -- Your configuration goes here
      -- Leave empty to use the default configuration
      -- Please see the Configuration section below for more information
    })
  end,
}

return M
