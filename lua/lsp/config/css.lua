local setup = require("lsp.lsp-setup")

local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
-- local capabilities = require("lsp.lsp-setup")

-- Setup lspconfig.

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").cssls.setup({
  capabilities = capabilities,
  filetypes = {
    "css",
    "scss",
    "less",
    "jsx",
    "js",
    "ts",
    "tsx",
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  on_attach = require("lsp.lsp-attach").on_attach,
})

-- lspconfig.cssls.setup({
-- 	capabilities = setup.capabilities,
-- 	filetypes = { "css", "scss", "less", "jsx", "tsx", "javascriptreact", "typescriptreact" },
-- })

lspconfig.html.setup({
  capabilities = setup.capabilities,
  on_attach = require("lsp.lsp-attach").on_attach,
})

if not lspconfig.emmet_ls then
  configs.emmet_ls = {
    default_config = {
      cmd = { "emmet-ls", "--stdio" },
      filetypes = {
        "html",
        "css",
        "blade",
        "jsx",
        "tsx",
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      root_dir = function(fname)
        return vim.loop.cwd()
      end,
      settings = {},
    },
  }
end
lspconfig.emmet_ls.setup({ capabilities = setup.capabilities })
