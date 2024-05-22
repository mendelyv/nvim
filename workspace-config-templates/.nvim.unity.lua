local keymap = require("utils.keymap")
local options = require("base.options")
local utils = require("utils.utils")

-- telescope搜索忽略文件
options.telescope_file_ignore_patterns = utils.table_merge(options.telescope_file_ignore_patterns, {
  "Library",
  "bin",
  "Logs",
  "Packages",
  "ProjectSettings",
  "UserSettings",
  "%.meta",
  "%.unity",
  "%.mat",
})

-- nvim-tree忽略文件
options.nvim_tree_filters_custom = utils.table_merge(options.nvim_tree_filters_custom, {
  "*.meta",
  "*.unity",
})
local nvim_tree_module = require("configs.editor.nvim-tree")
nvim_tree_module.reload()

-- For go_to_definition to work fully, extended textDocument/definition handler is needed
-- https://github.com/Hoffs/omnisharp-extended-lsp.nvim
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
