local global = require("keymap.global")
local map = global.map
mapOptions = global.mapOptions

-- i hate escape
map("i", "ii", "<esc>", mapOptions)
-- map("i", ";;", "<ESC>", mapOptions)
-- map("i", "jj", "<ESC>", mapOptions)

-- i hate escape
map("v", "ii", "<esc>", mapOptions)
-- map('v', ';;', '<ESC>', mapOptions)
