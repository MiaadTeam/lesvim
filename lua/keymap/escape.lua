local global = require("keymap.global")
 local map = global.map
 mapOptions = global.mapOptions

-- i hate escape
map('i', 'jk', '<esc>', mapOptions)
map('i', 'kj', '<ESC>', mapOptions)
map('i', 'jj', '<ESC>', mapOptions)

-- i hate escape
map('v', 'jk', '<esc>', mapOptions)
map('v', 'kj', '<ESC>', mapOptions)
