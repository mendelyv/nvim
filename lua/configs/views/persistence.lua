-- https://github.com/folke/persistence.nvim

local options = require("base.options")
local keymap = require("utils.keymap")

local M = {
  requires = {
    "persistence",
  },
}

function M.before()
  M.register_key()
end

function M.load()
  M.persistence.setup({
    dir = options.session_directory,
  })
end

function M.register_key()
  keymap.register_all({
    {
      mode = { "n" },
      lhs = "<leader>sl",
      rhs = function()
        require("persistence").load()
      end,
      options = { silent = true },
      description = "load session",
    },
    {
      mode = { "n" },
      lhs = "<leader>sl",
      rhs = function()
        require("persistence").load()
      end,
      options = { silent = true },
      description = "load session",
    },
  })
end

return M
