-- Global Variables
require("global.vars")
require("global.compat")
vim.g.skip_ts_context_commentstring_module = true

-- Settings
require("settings")
-- require("terminal")

--Package configurations
require("lazy.init")

-- Global Mappings and functions executed on startup
require("global.colorschema")
require("global.map")
require("global.exec")

-- Key Mappings
require("keymap")

-- LSP
require("lsp.init")
-- require("lsp.lspinstall")
-- require("lsp.ts-js-deno")
--
