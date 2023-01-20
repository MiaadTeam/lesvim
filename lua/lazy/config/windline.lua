-- Description : Animation statusline, floating window statusline. Use lua + luv make some wind
-- Link : https://github.com/windwp/windline.nvim

local M = {
  "windwp/windline.nvim",
  config = function()
    require("lazy.settings.windline")
    -- require("windline").add_status(require("spectre.state_utils").status_line())
  end,
}

return M
