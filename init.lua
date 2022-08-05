-- Global Variables
require("global.vars")
--Package configurations
require("packer.loader")
require("packer.plugins")

-- Key Mappings
require("keymap")

-- Settings
require("settings")
-- require("terminal")

-- LSP
require("lsp.init")
-- require("lsp.lspinstall")
-- require("lsp.ts-js-deno")

-- Global Mappings and functions executed on startup
require("global.colorschema")
require("global.map")
require("global.exec")
