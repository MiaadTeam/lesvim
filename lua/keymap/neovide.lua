local map = vim.api.nvim_set_keymap
local mapOptions = { noremap = true, silent = true }

--Remap space as leader key
map("", "<Space>", "<Nop>", mapOptions)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- copy past on neovide
-- map("i", "<D-v>", "<C-r>+", mapOptions)

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> ("\\<C-n>")')
vim.cmd('inoremap <expr> <c-k> ("\\<C-p>")')

-- fix to get netrw's gx command to work correctly
map(
  "n",
  "gx",
  ":call netrw#BrowseX(expand((exists('g:netrw_gx')? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())<cr>",
  { noremap = true, silent = true }
)

-- vim.cmd('vnoremap p "0p')
-- vim.cmd('vnoremap P "0P')

return {
  map = map,
  mapOptions = mapOptions,
}
