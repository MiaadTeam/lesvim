-- Description : Find the enemy and replace them with dark power.
-- Link : https://github.com/windwp/nvim-spectre

local M = {
  "windwp/nvim-spectre",
  config = function()
    require("spectre").setup()
  end,
}

return M
