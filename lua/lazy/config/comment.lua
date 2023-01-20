-- Description : 🧠 💪 // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
-- Link : https://github.com/numToStr/Comment.nvim

local M = {
  "numToStr/Comment.nvim",
  config = function()
    require("lazy.settings.ts-comment")
  end,
}

return M
