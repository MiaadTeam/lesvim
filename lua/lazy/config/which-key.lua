-- Description : 💥 Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.
-- Link : https://github.com/folke/which-key.nvim

local M = {
  "folke/which-key.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  config = function()
    local myWKConfig = require("lazy.settings.which-key")
    local wk = require("which-key")
    wk.setup(myWKConfig.settings)
    wk.add(myWKConfig.normal_mappings)
    wk.add(myWKConfig.visual_mappings)
  end,
}

return M
