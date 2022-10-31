local M = {
  "glepnir/lspsaga.nvim",
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require("lspsaga").init_lsp_saga()
  end,
}

return M
