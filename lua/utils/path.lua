-- 路径工具模块
local M = {}

-- 拼接文件路径，使用"/"分隔
function M.join(...)
  return table.concat(vim.iter({ ... }):flatten():totable(), "/")
end

--- 去掉路径中的文件名部分，只保留目录
--- 示例：
---   "/a/b/c.txt"     -> "/a/b/"
---   "src/main.lua"   -> "src/"
---   "main.lua"       -> ""
function M.trim_filename(path)
  -- 移除末尾斜线（兼容 Windows 和 Unix）
  path = path:gsub("[/\\]+$", "")
  -- 找到最后一个分隔符的位置
  local last_sep = path:find("[/\\][^/\\]*$")

  if last_sep then
    -- 截取路径并移除末尾斜线
    return path:sub(1, last_sep - 1)
  else
    return "" -- 没有目录部分
  end
end

return M
