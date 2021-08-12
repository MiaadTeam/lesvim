local global = require("keymap.global")
 local map = global.map
 mapOptions = global.mapOptions

 map('n','<C-t>',':ToggleTerm direction=float<cr>',mapOptions)
