-- https://github.com/nvim-tree/nvim-tree.lua

local keymap = require("utils.keymap")
local icons = require("utils.icons").get_icons("diagnostic", false)

local M = {
  requires = {
    "nvim-tree",
  },
}

function M.load()
  M.nvim_tree.setup({
    view = {
      width = 35,
      side = "left",
      number = true,
      relativenumber = true,
    },
    diagnostics = {
      icons = {
        hint = icons.Hint,
        info = icons.Info,
        warning = icons.Warn,
        error = icons.Error,
      },
    },
    git = {
      enable = false,
    },
    filters = {
      dotfiles = false,
      custom = {
        "*.meta",
        "*.DS_Store",
      },
    },
    actions = {
      use_system_clipboard = true,
      open_file = {
        window_picker = { enable = true },
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
      mode = { "n" },
      lhs = "<leader>1",
      rhs = function()
        require("nvim-tree.api").tree.toggle({ find_file = true, focus = true })
      end,
      options = { silent = true },
      description = "Open file explorer",
    },
  })
end

return M
