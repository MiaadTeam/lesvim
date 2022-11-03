-- Description : A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI.
-- Link : https://github.com/glepnir/lspsaga.nvim

local M = {
  "glepnir/lspsaga.nvim",
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require("lspsaga").init_lsp_saga()
  end,
}

return M
