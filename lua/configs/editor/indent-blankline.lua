-- https://github.com/lukas-reineke/indent-blankline.nvim
local highlight = require("utils.highlight")

local M = {
  requires = {
    "ibl",
  },
}

function M.load()
  M.ibl.setup({
    indent = {
      char = "┊",
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
      char = "│",
    },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  })
end

function M.after()
  highlight.overwrite_indent_blankline_plugin_highlight()
end

return M
