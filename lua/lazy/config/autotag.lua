-- Description : Use treesitter to auto close and auto rename html tag
-- Link : https://github.com/windwp/nvim-ts-autotag

local M = {
  "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}

return M
