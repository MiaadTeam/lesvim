-- Description :  Neovim motions on speed!
-- Link : https://github.com/phaazon/hop.nvim

local M = {
  "pfeiferj/nvim-hurl",
  branch = "main", -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require("hurl").setup({})
  end,
}

return M
