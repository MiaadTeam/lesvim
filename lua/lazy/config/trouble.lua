-- Description : 🚦 A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
-- Link : https://github.com/folke/trouble.nvim

local M = {
  "folke/trouble.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function()
    require("trouble").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    })
  end,
}

return M
