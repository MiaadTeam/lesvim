vim.opt.termguicolors = true
local highlight = {
  "IndentHighlightListBlank1",
  "IndentHighlightListBlank2",
  "IndentHighlightListBlank3",
  "IndentHighlightListBlank4",
  "IndentHighlightListBlank5",
  "IndentHighlightListBlank6",
}

local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "IndentHighlightListBlank1", { fg = "#E06C75", nocombine = true })
  vim.api.nvim_set_hl(0, "IndentHighlightListBlank2", { fg = "#E5C07B", nocombine = true })
  vim.api.nvim_set_hl(0, "IndentHighlightListBlank3", { fg = "#98C379", nocombine = true })
  vim.api.nvim_set_hl(0, "IndentHighlightListBlank4", { fg = "#56B6C2", nocombine = true })
  vim.api.nvim_set_hl(0, "IndentHighlightListBlank5", { fg = "#61AFEF", nocombine = true })
  vim.api.nvim_set_hl(0, "IndentHighlightListBlank6", { fg = "#C678DD", nocombine = true })
  vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { bg = "#291d29", nocombine = true })
  vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { bg = "#1f2b28", nocombine = true })
  vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { bg = "#2f2a3b", nocombine = true })
  vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { bg = "#262933", nocombine = true })
end)

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("ibl").setup({
  indent = {
    highlight = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
    },
  },
  whitespace = {
    highlight = highlight,
    remove_blankline_trail = false,
  },
  scope = {
    enabled = true,
    highlight = highlight,
    show_start = true,
    show_end = false,
  },
})
