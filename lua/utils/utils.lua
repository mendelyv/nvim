local M = {}

--- 合并table，返回一个新的table
---@param t1 table
---@param t2 table
---@return table
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

--- 打印table
---@param data table
---@param showMetatable boolean
---@param lastCount number 用于递归打印table时记录上一层的层数
function M.print_table(data, showMetatable, lastCount)
  if type(data) ~= "table" then
    --Value
    if type(data) == "string" then
      io.write("\"", data, "\"")
    else
      io.write(tostring(data))
    end
  else
    --Format
    local count = lastCount or 0
    count = count + 1
    io.write("{\n")
    --Metatable
    if showMetatable then
      for i = 1, count do io.write("\t") end
      local mt = getmetatable(data)
      io.write("\"__metatable\" = ")
      M.print_table(mt, showMetatable, count) -- 如果不想看到元表的元表，可将showMetatable处填nil
      io.write(",\n")                         --如果不想在元表后加逗号，可以删除这里的逗号
    end
    --Key
    for key, value in pairs(data) do
      for i = 1, count do io.write("\t") end
      if type(key) == "string" then
        io.write("\"", key, "\" = ")
      elseif type(key) == "number" then
        io.write("[", key, "] = ")
      else
        io.write(tostring(key))
      end
      M.print_table(value, showMetatable, count) -- 如果不想看到子table的元表，可将showMetatable处填nil
      io.write(",\n")                            --如果不想在table的每一个item后加逗号，可以删除这里的逗号
    end
    --Format
    for i = 1, lastCount or 0 do io.write("\t") end
    io.write("}")
  end
  --Format
  if not lastCount then
    io.write("\n")
  end
end

return M
