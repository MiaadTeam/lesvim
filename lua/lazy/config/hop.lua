-- Description :  Neovim motions on speed!
-- Link : https://github.com/phaazon/hop.nvim

local M = {
  "phaazon/hop.nvim",
  branch = "v1", -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
  end,
}

return M
