 local map = vim.api.nvim_set_keymap
 mapOptions = { noremap = true, silent = true }

-- copy past on neovide
map('i', '<D-v>', '<C-r>+', mapOptions)

return {
 map = map,
 mapOptions = mapOptions
 }
