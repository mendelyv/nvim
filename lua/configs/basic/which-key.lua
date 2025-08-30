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
      group = "󰉺 ",
    },
    win = {
      no_overlap = false,
      border = options.float_border and "single" or "none",
    },
  })
end

function M.after()
  -- global leader
  M.which_key.add({
    { "<leader>af", group = "Find ...", },
    { "<leader>b",  group = "Buffers" },
    { "<leader>c",  group = "Code" },
    { "<leader>d",  group = "Debug" },
    { "<leader>f",  group = "Find" },
    { "<leader>h",  group = "Hop", },
    { "<leader>n",  group = "Neogen", },
    { "<leader>r",  group = "Replace", },
    { "<leader>rw", desc = "Replace Word To ..." },
    { "<leader>s",  group = "Session" },
  })

  -- comment
  M.which_key.add({
    { "gb", desc = "Switch the specified line to a block comment", mode = "v" },
    { "gc", desc = "Switch the specified line to a line comment",  mode = "v" },
  })
end

return M
