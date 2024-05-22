-- https://github.com/nvim-tree/nvim-tree.lua

local keymap = require("utils.keymap")
local icons = require("utils.icons").get_icons("diagnostic", false)
local options = require("base.options")

local M = {
  requires = {
    "nvim-tree",
  },
  options = {
    view = {
      width = { min = 30, max = -1 },
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
      git_ignored = false,
      dotfiles = false,
      custom = options.nvim_tree_filters_custom,
    },
    actions = {
      use_system_clipboard = true,
      open_file = {
        window_picker = { enable = true },
      },
    },
  },
}

function M.before()
  M.register_keys()
end

function M.load()
  M.nvim_tree.setup(M.options)
end

function M.reload()
  M.nvim_tree = require("nvim-tree")
  M.load()
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
