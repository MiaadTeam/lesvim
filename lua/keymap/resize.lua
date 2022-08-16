local global = require("keymap.global")
local map = global.map
local mapOptions = global.mapOptions

-- TODO fix this
-- resize with arrows
map("n", "<A-k>", ":resize -2<CR>", mapOptions)
map("n", "<A-j>", ":resize +2<CR>", mapOptions)
map("n", "<A-l>", ":vertical resize -2<CR>", mapOptions)
map("n", "<A-h>", ":vertical resize +2<CR>", mapOptions)
