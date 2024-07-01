local M = {}

--- 是否windows系统
function M.is_windows()
  return vim.uv.os_uname().sysname:find("Windows") ~= nil
end

-- 加载插件依赖包，注意需要插件配置模块reqiures字段
function M.require_packages(module)
  if not module.requires then
    return
  end

  local replace_char = {
    ["%."] = "_",
    ["%-"] = "_",
  }

  for _, require_name in ipairs(module.requires) do
    local use_name = require_name
    for char, replace in pairs(replace_char) do
      if use_name:match(char) then
        use_name = (use_name:gsub(char, replace)):lower()
      end
    end
    module[use_name:lower()] = require(require_name)
  end
end

return M
