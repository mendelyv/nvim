-- 路径工具模块
local M = {}

-- 拼接文件路径，使用"/"分隔
function M.join(...)
  return table.concat(vim.tbl_flatten({ ... }), "/")
end

return M
