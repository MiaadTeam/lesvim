local global = require("keymap.global")
local map = global.map
local mapOptions = global.mapOptions

-- better window movement
map("n", "<C-h>", "<C-w>h", mapOptions)
map("n", "<C-j>", "<C-w>j", mapOptions)
map("n", "<C-k>", "<C-w>k", mapOptions)
map("n", "<C-l>", "<C-w>l", mapOptions)
map("n", "<C-s>", "<C-w>w", mapOptions)

