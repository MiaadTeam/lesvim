local M = {
  "lewis6991/gitsigns.nvim",
  requires = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("gitsigns").setup()
  end,
}

return M
