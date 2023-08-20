-- local on_attach = require("lsp.lsp-setup").on_attach
local setup = require("lsp.lsp-setup")
local nvim_lsp = require("lspconfig")

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

if file_exists(os.getenv("PWD") .. "/deno.json") or file_exists(os.getenv("PWD") .. "/deno.jsonc") then
  nvim_lsp.denols.setup({
    capabilities = setup.capabilities,
    autostart = true,
    cmd = { "deno", "lsp" },
    on_attach = require("lsp.lsp-attach").on_attach,
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    init_options = {
      enable = true,
      lint = true,
      unstable = true,
    },
    root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
  })
else
  nvim_lsp.tsserver.setup({
    capabilities = setup.capabilities,
    autostart = true,
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    on_attach = require("lsp.lsp-attach").on_attach, -- This makes sure tsserver is not used for formatting (I prefer prettier)
    -- settings = { documentFormatting = false },
    commands = {
      OrganizeImports = {
        organize_imports,
        description = "Organize Imports",
      },
    },
    root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  })
end
