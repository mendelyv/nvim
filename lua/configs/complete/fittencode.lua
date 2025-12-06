-- https://github.com/luozhiya/fittencode.nvim

local keymap = require("utils.keymap")

local M = {
  requires = {
    "fittencode",
  },
}

function M.before()
  M.register_key()
end

function M.load()
  M.fittencode.setup({
    disable_specific_inline_completion = {
      suffixes = { "TelescopePrompt" },
    },
    use_default_keymaps = false,
    -- completion_mode = "source",
  })
end

function M.register_key()
  keymap.register_all({
    {
      mode = { "i" },
      lhs = "<c-l>",
      rhs = function()
        M.fittencode.accept_line()
      end,
      options = { silent = true },
      description = "Accept fittencode line",
    },
  })
end

return M
