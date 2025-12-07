local options = require("base.options")
local utils = require("utils.utils")

-- telescope搜索忽略文件
options.telescope_file_ignore_patterns = utils.table_merge(options.telescope_file_ignore_patterns, {
  "library",
  "bin",
  "settings",
  "packages",
  "temp",
  "%.meta",
  "%.fire",
})

-- nvim-tree忽略文件
options.nvim_tree_filters_custom = utils.table_merge(options.nvim_tree_filters_custom, {
  "*.meta",
  "*.fire",
})
