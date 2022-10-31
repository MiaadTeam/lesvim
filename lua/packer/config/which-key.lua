local M = {
  "folke/which-key.nvim",
  config = function()
    local myWKConfig = require("packer.settings.which-key")
    local wk = require("which-key")
    wk.setup({
      myWKConfig.settings,
    })
    local opts = myWKConfig.normalOpts
    local vopts = myWKConfig.visualOpts

    local mappings = myWKConfig.mappings
    local vmappings = myWKConfig.vmappings

    wk.register(mappings, opts)
    wk.register(vmappings, vopts)
  end,
}

return M
