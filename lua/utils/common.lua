local M = {}

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

function M.get_all_window_buffer_filetype()
  local window_buffer_filetype = {}
  local window_tables = vim.api.nvim_list_wins()
  for _, window_id in ipairs(window_tables) do
    if vim.api.nvim_win_is_valid(window_id) then
      local buffer_id = vim.api.nvim_win_get_buf(window_id)
      table.insert(window_buffer_filetype, {
        window_id = window_id,
        buffer_id = buffer_id,
        buffer_filetype = vim.api.nvim_buf_get_option(buffer_id, "filetype"),
      })
    end
  end
  return window_buffer_filetype
end

return M
