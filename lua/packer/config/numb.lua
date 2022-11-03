-- Description :  Peek lines just when you intend
-- Link : https://github.com/nacro90/numb.nvim

local M = {
  "nacro90/numb.nvim",
  config = function()
    require("numb").setup()
  end,
}

return M
