local map_util = require("utils.keymap")

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
      vim.cmd("NvimTreeClose")
      vim.cmd("wincmd _")
      vim.cmd("wincmd |")
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
    rhs = "<cmd>bdelete<cr>",
    options = { silent = true },
    description = "Close current buffer",
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

return M
