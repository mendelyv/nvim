local map_util = require("utils.keymap")
local common = require("utils.common")

local M = {}

map_util.register_all({
  {
    mode = { "n" },
    lhs = "<esc>",
    rhs = ":noh<cr>",
    options = { silent = true },
    description = "Clear search hightlight",
  },
  {
    mode = { "n" },
    lhs = "<c-w>a",
    rhs = function()
      local tree = require("nvim-tree.api").tree
      if nil ~= tree and tree.is_visible then tree.close() end
      vim.cmd("wincmd _")
      vim.cmd("wincmd |")
      vim.cmd("wincmd 5-")
      vim.cmd("wincmd 20<")
    end,
    options = { silent = true },
    description = "Full screen current buffer",
  },
  {
    mode = { "n", "v" },
    lhs = "d",
    rhs = '"_d',
    options = { noremap = true },
  },
  {
    mode = { "n" },
    lhs = "<c-q>",
    rhs = function()
      require("utils.buffer").close_current()
    end,
    options = { silent = true },
    description = "Close current buffer",
  },
  {
    mode = { "n" },
    lhs = "<leader>abq",
    rhs = function()
      require("utils.buffer").close_current(true)
    end,
    options = { silent = true },
    description = "Force close current buffer",
  },
  {
    mode = { "n" },
    lhs = "<c-l>",
    rhs = "<cmd>bnext<cr>",
    options = { silent = true },
    description = "Go to right buffer",
  },
  {
    mode = { "n" },
    lhs = "<c-h>",
    rhs = "<cmd>bprevious<cr>",
    options = { silent = true },
    description = "Go to left buffer",
  },
  {
    mode = { "n" },
    lhs = "<leader>bo",
    rhs = function()
      require("utils.buffer").close_other()
    end,
    options = { silent = true },
    description = "Close all other buffers",
  },
})

local function windows_open_current_directory_keymap()
  if not common.is_windows() then return end
  map_util.register({
    mode = { "n" },
    lhs = "<leader>afs",
    rhs = function()
      local dir = vim.fn.expand("%:p:h")
      if dir == "" then
        vim.notify("Buffer has no file path", vim.log.levels.WARN)
        return
      end
      dir = vim.fn.system({ "cygpath", "-w", dir }):gsub("\n", "")
      local cmd = "explorer " .. vim.fn.shellescape(dir)
      vim.fn.jobstart(cmd, { detach = true })
    end,
    options = { silent = true },
    description = "Open current directory in Windows Explorer",
  })
end

windows_open_current_directory_keymap()

return M
