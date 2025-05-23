-- https://github.com/mhartington/formatter.nvim

local keymap = require('utils.keymap')
local options = require("base.options")
local common = require("utils.common")

local M = {
  requires = {
    "formatter",
    "formatter.util",
  },
}

function M.parserExecutableName(name)
  if common.is_windows() then
    return name .. ".cmd"
  end
  return name
end

function M.load()
  local prettier = {
    function(parser)
      if not parser then
        return {
          exe = M.parserExecutableName("prettier"),
          args = {
            "--stdin-filepath",
            M.formatter_util.escape_path(M.formatter_util.get_current_buffer_file_path()),
          },
          stdin = true,
          try_node_modules = true,
        }
      end

      return {
        exe = M.parserExecutableName("prettier"),
        args = {
          "--stdin-filepath",
          M.formatter_util.escape_path(M.formatter_util.get_current_buffer_file_path()),
          "--parser",
          parser,
        },
        stdin = true,
        try_node_modules = true,
      }
    end
  }

  M.filetype_options = {
    python = {
      function()
        return {
          exe = M.parserExecutableName("autopep8"),
          args = { "-" },
          stdin = 1,
        }
      end
    },
    json = prettier,
    jsonc = prettier,
    -- typescript = prettier,
  }

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
