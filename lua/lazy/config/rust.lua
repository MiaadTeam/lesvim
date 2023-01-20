-- Description : Tools for better development in rust using neovim's builtin lsp
-- Link : https://github.com/simrat39/rust-tools.nvim

local M = {
  "simrat39/rust-tools.nvim",
  config = function()
    require("lazy.settings.rust")
  end,
}

return M
