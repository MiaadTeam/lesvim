local global = require("keymap.global")
 local map = global.map
 mapOptions = global.mapOptions

-- TODO fix this
-- resize with arrows
map('n', '<C-Up>', ':resize -2<CR>', mapOptions)
map('n', '<C-Down>', ':resize +2<CR>', mapOptions)
map('n', '<C-Left>', ':vertical resize -2<CR>', mapOptions)
map('n', '<C-Right>', ':vertical resize +2<CR>', mapOptions)
