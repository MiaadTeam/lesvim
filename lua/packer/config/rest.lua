-- Description : A fast Neovim http client written in Lua
-- Link : https://github.com/NTBBloodbath/rest.nvim

local M = {
  "NTBBloodbath/rest.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("packer.settings.rest")
  end,
}

return M
