local M = {}

--- 合并table，返回一个新的table
---@param t1 
---@param t2 
---@return 
function M.table_merge(t1, t2)
  local merged_table = {}
  for i = 1, #t1 do
    table.insert(merged_table, t1[i])
  end
  for i = 1, #t2 do
    table.insert(merged_table, t2[i])
  end
  return merged_table
end

return M
