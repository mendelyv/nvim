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

function M.generate_lazygit()
  if nil ~= M.lazygit then return end
  local Terminal = require('toggleterm.terminal').Terminal
  M.lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "single",
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
        if nil == M.lazygit then M.generate_lazygit() end
        M.lazygit:toggle()
      end,
      options = { silent = true },
      description = "open lazygit",
    },
    {
      mode = { "n" },
      lhs = "<leader>tn",
      rhs = function()
        M.open_new_normal_terminal()
      end,
      options = { silent = true },
      description = "open new terminal",
    },
    {
      mode = { "n" },
      lhs = "<leader>tf",
      rhs = function()
        M.open_new_float_terminal()
      end,
      options = { silent = true },
      description = "open float terminal",
    },
    {
      mode = { "n" },
      lhs = "<leader>tt",
      rhs = function()
        M.toggle_all_terminals()
      end,
      options = { silent = true },
      description = "toggle all terminals",
    },
    {
      mode = { "n" },
      lhs = "<leader>ts",
      rhs = function()
        M.shut_down_all_terminals()
      end,
      options = { silent = true },
      description = "shut down all terminals",
    },
  })
end

function M.open_new_float_terminal()
  local Terminal = require('toggleterm.terminal').Terminal
  local terminal = Terminal:new({
    direction = "float",
    float_opts = {
      border = "single",
    },
  })
  terminal:toggle()
end

function M.open_new_normal_terminal()
  local Terminal = require('toggleterm.terminal').Terminal
  local terminal = Terminal:new()
  terminal:toggle()
end

function M.toggle_all_terminals()
  local terminal = require("toggleterm.terminal");
  local terminals = terminal.get_all(true)
  for _, term in pairs(terminals) do
    term:toggle()
  end
end

function M.shut_down_all_terminals()
  local terminal = require("toggleterm.terminal");
  local terminals = terminal.get_all(true)
  for _, term in pairs(terminals) do
    term:shutdown()
  end
end

return M
