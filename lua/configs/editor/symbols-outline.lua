-- https://github.com/simrat39/symbols-outline.nvim

local keymap = require('utils.keymap')
local icons = require('utils.icons').get_icons('lsp_kind', false)

local M = {
  requires = {
    "symbols-outline",
  }
}

function M.before()
  M.register_keys()
end

function M.load()
  M.symbols_outline.setup({
    width = 40,
    show_numbers = true,
    show_relative_numbers = true,
    auto_close = true,
    autofold_depth = 2,
    auto_preview = false,
    symbols = {
      File = { icon = icons.File },
      Module = { icon = icons.Module },
      Namespace = { icon = icons.Namespace },
      Package = { icon = icons.Package },
      Class = { icon = icons.Class },
      Method = { icon = icons.Method },
      Property = { icon = icons.Property },
      Field = { icon = icons.Field },
      Constructor = { icon = icons.Constructor },
      Enum = { icon = icons.Enum },
      Interface = { icon = icons.Interface },
      Function = { icon = icons.Function },
      Variable = { icon = icons.Variable },
      Constant = { icon = icons.Constant },
      String = { icon = icons.String },
      Number = { icon = icons.Number },
      Boolean = { icon = icons.Boolean },
      Array = { icon = icons.Array },
      Object = { icon = icons.Object },
      Key = { icon = icons.Key },
      Null = { icon = icons.Null },
      EnumMember = { icon = icons.EnumMember },
      Struct = { icon = icons.Struct },
      Event = { icon = icons.Event },
      Operator = { icon = icons.Operator },
      TypeParameter = { icon = icons.TypeParameter },
    }
  })
end

function M.register_keys()
  keymap.register_all({
    {
      mode = { "n" },
      lhs = "<leader>2",
      rhs = "<cmd>SymbolsOutline<cr>",
      options = { silent = true },
      description = "Open Outline Explorer",
    },
  })
end

return M
