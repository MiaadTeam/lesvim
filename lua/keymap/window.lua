local global = require("keymap.global")
 local map = global.map
 mapOptions = global.mapOptions

-- better window movement
map('n', '<C-h>', '<C-w>h', mapOptions)
map('n', '<C-j>', '<C-w>j', mapOptions)
map('n', '<C-k>', '<C-w>k', mapOptions)
map('n', '<C-l>', '<C-w>l', mapOptions)

-- TODO fix this
-- Terminal window navigation
vim.cmd([[
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
]])
