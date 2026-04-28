local setup = require("lsp.lsp-setup")

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local cssls_config = {
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
}

local html_config = {
  capabilities = setup.capabilities,
  on_attach = require("lsp.lsp-attach").on_attach,
}

local emmet_config = {
  capabilities = setup.capabilities,
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
  root_dir = function()
    return vim.loop.cwd()
  end,
  settings = {},
}

if vim.lsp.config then
  vim.lsp.config("cssls", cssls_config)
  vim.lsp.config("html", html_config)
  vim.lsp.config("emmet_ls", emmet_config)
  vim.lsp.enable("cssls")
  vim.lsp.enable("html")
  vim.lsp.enable("emmet_ls")
else
  lspconfig.cssls.setup(cssls_config)
  lspconfig.html.setup(html_config)
  lspconfig.emmet_ls.setup(emmet_config)
end
