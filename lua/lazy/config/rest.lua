-- Description : A fast Neovim http client written in Lua
-- Link : https://github.com/NTBBloodbath/rest.nvim

local M = {
  "NTBBloodbath/rest.nvim",
  cmd = { "Rest" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("lazy.settings.rest")
  end,
}

return M
