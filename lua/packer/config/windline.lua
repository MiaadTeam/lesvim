local M = {
  "windwp/windline.nvim",
  config = function()
    require("packer.settings.windline")
    -- require("windline").add_status(require("spectre.state_utils").status_line())
  end,
}

return M
