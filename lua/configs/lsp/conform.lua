-- https://github.com/stevearc/conform.nvim

local options = require("base.options")
local keymap = require("utils.keymap")

local M = {
  requires = {
    "conform",
  },
}

function M.before()
  M.register_keys()
end

function M.load()
  M.conform.setup({
    formatters_by_ft = options.formatter_filetype_mapping,
  })
end

function M.register_keys()
  keymap.register_all({
    {
      mode = { "n" },
      lhs = "<leader>cf",
      rhs = function()
        require("conform").format()
      end,
      options = { silent = true },
      description = "Format buffer",
    },
  })
end

return M
