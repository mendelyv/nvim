-- https://github.com/mhartington/formatter.nvim

local keymap = require('utils.keymap')
local options = require("base.options")

local M = {
  requires = {
    "formatter",
  },
  filetype_options = {
    python = {
      function()
        return {
          exe = "autopep8",
          args = { "--in-place" },
          stdin = false,
        }
      end
    },
    json = {
      function()
        return {
          exe = "prettier",
          args = {
            "--config-precedence",
            "prefer-file",

            "--stdin-filepath",
            vim.api.nvim_buf_get_name(0),
          },
          stdin = true,
        }
      end
    },
  },
}

function M.load()
  M.formatter.setup({
    filetype = M.filetype_options,
  })
end

function M.after()
  M.register_keys()
end

function M.register_keys()
  keymap.register_all({
    {
      mode = { "n" },
      lhs = "<leader>cf",
      rhs = M.format,
      options = { silent = true },
      description = "Format buffer",
    },
  })
end

function M.format()
  local filetype = M.filetype_options[vim.bo.filetype];
  if filetype ~= nil then
    vim.cmd([[Format]])
    if options.show_formatter_notify then
      vim.notify('use ' .. vim.bo.filetype .. ' part formatter', 'INFO', { title = 'Formatter' })
    end
  else
    vim.lsp.buf.format()
    if options.show_formatter_notify then
      vim.notify('use native part formatter', 'INFO', { title = 'Formatter' })
    end
  end
end

return M
