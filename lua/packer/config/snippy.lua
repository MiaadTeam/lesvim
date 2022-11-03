-- Description : A snippets plugin for Neovim 0.5.0+ written in Lua.
-- Link : https://github.com/dcampos/nvim-snippy

local M = {
  "dcampos/nvim-snippy",
  config = function()
    require("snippy").setup({
      mappings = {
        is = {
          ["<Tab>"] = "expand_or_advance",
          ["<S-Tab>"] = "previous",
        },
        nx = {
          ["<leader>x"] = "cut_text",
        },
      },
    })
  end,
}

return M
