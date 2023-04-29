local global = require("keymap.global")
local map = global.map
local mapOptions = global.mapOptions

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", mapOptions)
map("x", "J", ":move '>+1<CR>gv-gv", mapOptions)

-- make < > shifts keep selection
map("v", "<", "<gv", mapOptions)
map("v", ">", ">gv", mapOptions)
