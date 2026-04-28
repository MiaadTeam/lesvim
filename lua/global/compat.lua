if vim.islist then
  vim.tbl_islist = vim.islist
end

if vim.iter then
  vim.tbl_flatten = function(t)
    return vim.iter(t):flatten(math.huge):totable()
  end
end

vim.lsp.buf_get_clients = vim.lsp.get_clients
