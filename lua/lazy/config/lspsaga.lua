-- Description : A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI.
-- Link : https://github.com/glepnir/lspsaga.nvim

local M = {
  "glepnir/lspsaga.nvim",
  event = "BufRead",
  config = function()
    require("lspsaga").setup({})
  end,
}

return M
