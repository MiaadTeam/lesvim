-- Description : A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
-- Link : https://github.com/akinsho/nvim-bufferline.lua

local M = {
  "akinsho/nvim-bufferline.lua",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function()
    require("bufferline").setup(require("lazy.settings.bufferline"))
  end,
}

return M
