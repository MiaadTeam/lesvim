-- Description : A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced".
-- Link : https://github.com/hrsh7th/nvim-cmp

local M = {
  "hrsh7th/nvim-cmp",
  requires = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    -- "L3MON4D3/LuaSnip",
    -- "saadparwaiz1/cmp_luasnip",
    "dcampos/nvim-snippy",
    "dcampos/cmp-snippy",
    "hrsh7th/cmp-emoji",
  },

  -- event = "InsertEnter",
  config = function()
    require("packer.settings.cmp")
  end,
}

return M
