-- a lua powered greeter like vim-startify / dashboard-nvim
local M = {
  "goolord/alpha-nvim",
  config = function()
    require("packer.settings.alpha")
  end,
}

return M
