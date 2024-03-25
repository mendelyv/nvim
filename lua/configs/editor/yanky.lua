-- https://github.com/gbprod/yanky.nvim

local keymap = require("utils.keymap")

local M = {
  requires = {
    "yanky",
  }
}

function M.load()
  M.yanky.setup({
    -- highlight = { timer = 150 },
  })
end

function M.after()
  keymap.register_all({
    {
      mode = { "n", "x", "v" },
      lhs = "<leader>fy",
      rhs = function()
        require("telescope").extensions.yank_history.yank_history()
      end,
      options = { silent = true },
      description = "Show yank history",
    },
    {
      mode = { "n", "x" },
      lhs = "p",
      rhs = "<Plug>(YankyPutAfter)",
      options = { silent = true },
      description = "Put yanked text after cursor",
    },
    {
      mode = { "n", "x" },
      lhs = "P",
      rhs = "<Plug>(YankyPutBefore)",
      options = { silent = true },
      description = "Put yanked text before cursor",
    },
    {
      mode = { "n", "x" },
      lhs = "gp",
      rhs = "<Plug>(YankyGPutAfter)",
      options = { silent = true },
      description = "Put yanked text after selection",
    },
    {
      mode = { "n", "x" },
      lhs = "gP",
      rhs = "<Plug>(YankyGPutBefore)",
      options = { silent = true },
      description = "Put yanked text after selection",
    },
    {
      mode = { "n" },
      lhs = "]p",
      rhs = "<Plug>(YankyPutIndentAfterLinewise)",
      options = { silent = true },
      description = "Put indented after cursor (linewise)",
    },
    {
      mode = { "n" },
      lhs = "[p",
      rhs = "<Plug>(YankyPutIndentBeforeLinewise)",
      options = { silent = true },
      description = "Put indented before cursor (linewise)",
    },
    {
      mode = { "n" },
      lhs = "]P",
      rhs = "<Plug>(YankyPutIndentAfterLinewise)",
      options = { silent = true },
      description = "Put indented after cursor (linewise)",
    },
    {
      mode = { "n" },
      lhs = "[P",
      rhs = "<Plug>(YankyPutIndentBeforeLinewise)",
      options = { silent = true },
      description = "Put indented before cursor (linewise)",
    },
    {
      mode = { "n" },
      lhs = ">p",
      rhs = "<Plug>(YankyPutIndentAfterShiftRight)",
      options = { silent = true },
      description = "Put and indent right",
    },
    {
      mode = { "n" },
      lhs = "<p",
      rhs = "<Plug>(YankyPutIndentAfterShiftLeft)",
      options = { silent = true },
      description = "Put and indent left",
    },
    {
      mode = { "n" },
      lhs = ">P",
      rhs = "<Plug>(YankyPutIndentBeforeShiftRight)",
      options = { silent = true },
      description = "Put before and indent right",
    },
    {
      mode = { "n" },
      lhs = "<P",
      rhs = "<Plug>(YankyPutIndentBeforeShiftLeft)",
      options = { silent = true },
      description = "Put before and indent left",
    },
  })
end

return M
