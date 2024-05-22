-- For go_to_definition to work fully, extended textDocument/definition handler is needed
-- https://github.com/Hoffs/omnisharp-extended-lsp.nvim

local keymap = require("utils.keymap")
keymap.register_all({
  {
    mode = { "n" },
    lhs = "gd",
    rhs = function()
      require('omnisharp_extended').telescope_lsp_definition({
        -- jump_type = "vsplit",
        fname_width = 200,
        show_line = false,
      })
    end,
    options = { silent = true },
    description = "Go to csharp definitions",
  },
})
