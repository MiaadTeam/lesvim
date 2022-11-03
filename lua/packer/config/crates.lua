-- Description : A neovim plugin that helps managing crates.io dependencies
-- Link : https://github.com/saecki/crates.nvim

local M = {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  requires = { { "nvim-lua/plenary.nvim" } },
  config = function()
    require("crates").setup()
  end,
}

return M
