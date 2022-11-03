-- Description : 💥 Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
-- Link : https://github.com/folke/noice.nvim

local M = {
  "folke/noice.nvim",
  event = "VimEnter",
  config = function()
    require("noice").setup()
  end,
  requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}

return M
