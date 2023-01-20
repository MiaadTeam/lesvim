-- vim.opt.termguicolors = true
vim.cmd([[highlight IndentHighlightListBlank1 guifg=#E06C75 gui=nocombine]])
vim.cmd([[highlight IndentHighlightListBlank2 guifg=#E5C07B gui=nocombine]])
vim.cmd([[highlight IndentHighlightListBlank3 guifg=#98C379 gui=nocombine]])
vim.cmd([[highlight IndentHighlightListBlank4 guifg=#56B6C2 gui=nocombine]])
vim.cmd([[highlight IndentHighlightListBlank5 guifg=#61AFEF gui=nocombine]])
vim.cmd([[highlight IndentHighlightListBlank6 guifg=#C678DD gui=nocombine]])

vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guibg=#291d29 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guibg=#1f2b28 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guibg=#2f2a3b gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guibg=#262933 gui=nocombine]])

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup({
  space_char_blankline = " ",
  show_trailing_blankline_indent = true,
  show_current_context = true,
  show_current_context_start = true,
  char_highlight_list = {
    "IndentHighlightListBlank1",
    "IndentHighlightListBlank2",
    "IndentHighlightListBlank3",
    "IndentHighlightListBlank4",
    "IndentHighlightListBlank5",
    "IndentHighlightListBlank6",
  },

  space_char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
  },
})
