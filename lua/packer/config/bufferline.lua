local M = {
  "akinsho/nvim-bufferline.lua",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      require("packer.settings.bufferline"),
    })
  end,
}

return M
