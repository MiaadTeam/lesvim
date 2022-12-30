-- Description : Describe the regular expression under the cursor.
-- Link : https://github.com/bennypowers/nvim-regexplainer

local M = {
  "bennypowers/nvim-regexplainer",
  requires = {
    "nvim-treesitter/nvim-treesitter",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("regexplainer").setup({})
  end,
}

return M
