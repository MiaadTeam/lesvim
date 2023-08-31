-- A Neovim plugin for polyglots and bidirectional writers.
-- Link : https://github.com/mcookly/rosetta.nvim

local M = {
  "mcookly/rosetta.nvim",
  config = function()
    require("rosetta").setup()
  end,
}

return M
