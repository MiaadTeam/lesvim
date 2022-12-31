-- Description : A neovim port of Assorted Biscuits. Ends up with more supported languages too.
-- Link : https://github.com/code-biscuits/nvim-biscuits

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
          prefix_string = " 🪡 ",
          max_length = 80,
        },
        javascriptreact = {
          prefix_string = " 🪡 ",
          max_length = 80,
        },
        typescript = {
          prefix_string = " 🪡 ",
          max_length = 80,
        },
        typescriptreact = {
          prefix_string = " 🪡 ",
          max_length = 80,
        },
      },
    })
  end,
  dependencies = {
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  },
}

return M
