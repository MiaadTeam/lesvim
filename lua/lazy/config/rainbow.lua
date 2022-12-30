-- Description : Rainbow parentheses for neovim using tree-sitter. This is a module for nvim-treesitter, not a standalone plugin. It requires and is configured via nvim-treesitter
-- Link : https://github.com/p00f/nvim-ts-rainbow

local M = {
  "p00f/nvim-ts-rainbow",
  config = function()
    require("packer.settings.rainbow")
  end,
}

return M
