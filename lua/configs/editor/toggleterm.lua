-- https://github.com/akinsho/toggleterm.nvim

local common = require("utils.common")
local keymap = require("utils.keymap")

local M = {
  requires = {
    "toggleterm",
  },
}

function M.before()
  M.register_keys()
end

function M.load()
  M.toggleterm.setup()
end

function M.after()
  local Terminal = require('toggleterm.terminal').Terminal
  M.lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "double",
    },
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      vim.cmd("startinsert!")
    end,
  })
end

function M.register_keys()
  keymap.register_all({
    {
      mode = { "n" },
      lhs = "<leader>tg",
      rhs = function()
        M.lazygit:toggle()
      end,
      options = { silent = true },
      description = "Open Lazygit",
    }
  })
end

return M
