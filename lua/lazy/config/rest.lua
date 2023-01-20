-- Description : A fast Neovim http client written in Lua
-- Link : https://github.com/NTBBloodbath/rest.nvim

local M = {
  "NTBBloodbath/rest.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("lazy.settings.rest")
  end,
}

return M
