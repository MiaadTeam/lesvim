-- Description : Nvim Treesitter configurations and abstraction layer
-- Link : https://github.com/nvim-treesitter/nvim-treesitter

local M = {
  "nvim-treesitter/nvim-treesitter",
  commit = "f197a15b0d1e8d555263af20add51450e5aaa1f0",
  build = ":TSUpdate",
  config = function()
    require("lazy.settings.treesitter")
  end,
}

return M
