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
})

return M
