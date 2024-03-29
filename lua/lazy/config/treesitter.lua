-- Description : Nvim Treesitter configurations and abstraction layer
-- Link : https://github.com/nvim-treesitter/nvim-treesitter

local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  requires = {
    {
      "pfeiferj/nvim-hurl",
      branch = "main",
    },
  },
  config = function()
    require("lazy.settings.treesitter")
  end,
}

return M
