-- https://github.com/folke/flash.nvim

local keymap = require("utils.keymap")

local M = {
  requires = {
    "flash",
  },
}

function M.load()
  M.flash.setup({
    modes = {
      search = {
        highlight = { backdrop = true },
      },
      char = {
        enabled = true,
        jump_labels = true,
        multi_line = false,
        label = { exclude = "gcisxdalh" },
        highlight = { backdrop = false },
      },
    },
  })
end

function M.after()
  M.register_keys()
end

function M.register_keys()
  keymap.register_all({
    {
      mode = { "n", "x", "o" },
      lhs = "s",
      rhs = function()
        require("flash").jump()
      end,
      options = { silent = true },
      description = "Jump to char",
    },
  })
end

return M
