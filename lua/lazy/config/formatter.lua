-- Description : A format runner for Neovim.
-- Link : https://github.com/mhartington/formatter.nvim

local M = {
  "mhartington/formatter.nvim",
  config = function()
    require("lazy.settings.format")
  end,
}

return M
