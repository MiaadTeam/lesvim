local map = vim.api.nvim_set_keymap
mapOptions = { noremap = true }

map("n", "<Tab>", ":BufferLineCycleNext<cr>", mapOptions)
map("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", mapOptions)
