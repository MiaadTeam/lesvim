local M = {
  "NTBBloodbath/rest.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("packer.settings.rest")
  end,
}

return M
