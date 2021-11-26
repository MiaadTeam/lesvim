local global = require("keymap.global")
local map = global.map
mapOptions = global.mapOptions

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", mapOptions)
map("x", "J", ":move '>+1<CR>gv-gv", mapOptions)
