local M = {
  "code-biscuits/nvim-biscuits",

  config = function()
    require("nvim-biscuits").setup({
      ensure_installed = "maintained",

      default_config = {
        max_length = 12,
        min_distance = 5,
        prefix_string = " 📎 ",
      },
      language_config = {
        html = {
          prefix_string = " 🌐 ",
        },
        javascript = {
          prefix_string = " ✨ ",
          max_length = 80,
        },
        javascriptreact = {
          prefix_string = " ✨ ",
          max_length = 80,
        },
        typescript = {
          prefix_string = " ✨ ",
          max_length = 80,
        },
        typescriptreact = {
          prefix_string = " ✨ ",
          max_length = 80,
        },
      },
    })
  end,
  requires = {
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  },
}

return M
