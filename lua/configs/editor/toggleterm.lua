-- https://github.com/akinsho/toggleterm.nvim

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
    },
    {
      mode = { "n" },
      lhs = "<leader>tt",
      rhs = function()
        M.open_new_normal_terminal()
      end,
      options = { silent = true },
      description = "Open Terminal",
    },
    {
      mode = { "n" },
      lhs = "<leader>tf",
      rhs = function()
        M.open_new_float_terminal()
      end,
      options = { silent = true },
      description = "Open Float Terminal",
    },
  })
end

function M.open_new_float_terminal()
  local Terminal = require('toggleterm.terminal').Terminal
  local terminal = Terminal:new({
    direction = "float",
    float_opts = {
      border = "double",
    },
  })
  terminal:toggle()
end

function M.open_new_normal_terminal()
  local Terminal = require('toggleterm.terminal').Terminal
  local terminal = Terminal:new()
  terminal:toggle()
end

return M
