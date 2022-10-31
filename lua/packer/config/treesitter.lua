local M = {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("packer.settings.treesitter")
  end,
}

return M
