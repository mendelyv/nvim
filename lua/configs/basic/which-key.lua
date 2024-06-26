-- https://github.com/folke/which-key.nvim

local options = require("base.options")

local M = {
  requires = {
    "which-key",
  },
}

function M.before() end

function M.load()
  M.which_key.setup({
    plugins = {
      spelling = {
        enabled = true,
        suggestions = 20,
      },
    },
    icons = {
      separator = '󱚃 ',
      group = "󰉺 ",
    },
    window = {
      border = options.float_border and "single" or "none",
    },
  })
end

function M.after()
  -- global leader
  M.which_key.register({
    a = { name = "Auxiliaries", f = "Find ..." },
    b = { name = "Buffers" },
    c = { name = "Code" },
    d = { name = "Debug" },
    f = { name = "Find" },
    r = { name = "Replace", w = "Replace Word To ..." },
    s = { name = "Session" },
    h = { name = "Hop" },
    -- t = {
    --     name = "Terminal",
    --     -- name = "Terminal | Translate",
    --     -- c = "Translate English to Chinese",
    --     -- e = "Translate Chinese to English",
    -- },
    n = { name = "Neogen" },
  }, { prefix = "<leader>", mode = "n" })

  -- comment
  -- M.which_key.register({
  --   c = {
  --     name = "Comment",
  --     c = "Toggle line comment",
  --     b = "Toggle block comment",
  --     a = "Insert line comment to line end",
  --     j = "Insert line comment to next line",
  --     k = "Insert line comment to previous line",
  --   },
  -- }, { prefix = "g", mode = "n" })

  -- M.which_key.register({
  --   c = "Switch the specified line to a line comment",
  --   b = "Switch the specified line to a block comment",
  -- }, { prefix = "g", mode = "v" })

  -- surround
  M.which_key.register({
    q = "Switch Surround",
    s = "Change Surround",
  }, { prefix = "c", mode = "n" })

  -- M.which_key.register({
  --   s = "Delete Surround",
  -- }, { prefix = "d", mode = "n" })

  M.which_key.register({
    s = "Add Surround",
  }, { prefix = "y", mode = "n" })
end

return M
