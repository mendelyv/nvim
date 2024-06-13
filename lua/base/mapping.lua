local map_util = require("utils.keymap")

local M = {}

map_util.register_all({
  {
    mode = { "t" },
    lhs = "<esc>",
    rhs = "<c-\\><c-n>",
    options = { silent = true },
    description = "Escape terminal intert mode",
  },
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
    rhs = "<c-w>_<c-w>|",
    options = { silent = true },
    description = "Full screen current buffer",
  },
  {
    mode = { "n", "v" },
    lhs = "d",
    rhs = '"_d',
    options = { noremap = true },
  },
})

return M
