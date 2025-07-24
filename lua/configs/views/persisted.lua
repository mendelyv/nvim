-- https://github.com/olimorris/persisted.nvim

local keymap = require("utils.keymap")
local options = require("base.options")

local M = {
  requires = {
    "persisted",
  },
}

function M.before()
  M.register_key()
end

function M.load()
  M.persisted.setup({
    -- vim.fn.stdpath("cache")不同操作系统的默认路径
    -- Linux: ~/.cache/nvim
    -- macOS: ~/.cache/nvim
    -- Windows: ~/AppData/Local/nvim
    save_dir = options.session_directory,
    -- use_git_branche = true,
    -- command = "VimLeavePre",
    -- autosave = true,
    -- branch_separator = "_",
    -- after_save = function()
    --   vim.cmd("nohlsearch")
    -- end,
    should_autosave = function()
      -- do not autosave if the alpha dashboard is the current filetype
      if vim.bo.filetype == "alpha" then
        return false
      end
      return true
    end,
  })
end

function M.after() end

function M.register_key()
  keymap.register_all({
    {
      mode = { "n" },
      lhs = "<leader>sl",
      rhs = "<cmd>silent! SessionLoad<cr>",
      options = { silent = true },
      description = "Load session",
    },
    {
      mode = { "n" },
      lhs = "<leader>ss",
      rhs = function()
        vim.cmd("silent! SessionSave")
        vim.api.nvim_echo({ { "Session saved success", "MoreMsg" } }, true, {})
      end,
      options = { silent = true },
      description = "Save session",
    },
    {
      mode = { "n" },
      lhs = "<leader>sd",
      rhs = function()
        local ok, _ = pcall(function() return vim.cmd end, "SessionDelete")
        if ok then
          vim.api.nvim_echo({ { "Session deleted success", "MoreMsg" } }, true, {})
        else
          vim.api.nvim_echo({ { "Session deleted failure", "ErrorMsg" } }, true, {})
        end
      end,
      options = { silent = true },
      description = "Delete session",
    },
  })
end

return M
