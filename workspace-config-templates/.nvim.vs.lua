local options = require("base.options")
local utils = require("utils.utils")

-- telescope搜索忽略文件
options.telescope_file_ignore_patterns = utils.table_merge(options.telescope_file_ignore_patterns, {
  "%.vcxproj",
  "%.sln",

  "compile_commands.json",
})
