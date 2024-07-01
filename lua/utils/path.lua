-- 路径工具模块
local M = {}

-- 拼接文件路径，使用"/"分隔
function M.join(...)
  return table.concat(vim.iter({ ... }):flatten():totable(), "/")
end

return M
