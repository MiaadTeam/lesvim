local M = {
  "windwp/nvim-autopairs",
  after = "nvim-cmp",
  config = function()
    require("packer.settings.autopairs")
  end,
}

return M
