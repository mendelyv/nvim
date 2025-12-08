local M = {}

function M.close(id, _force)
  if not vim.api.nvim_buf_is_valid(id) then
    vim.notify("buffer is invalid", vim.log.levels.ERROR, { title = "Buffer" })
    return
  end
  if _force == nil then _force = false end
  vim.api.nvim_buf_delete(id, { force = _force })
end

function M.close_current(_force)
  if _force == nil then _force = false end
  local current_id = vim.api.nvim_get_current_buf()
  if not vim.api.nvim_buf_is_valid(current_id) then
    vim.notify("buffer is invalid", vim.log.levels.ERROR, { title = "Buffer" })
    return
  end
  if not _force then
    if vim.api.nvim_get_option_value("modified", { buf = current_id }) then
      M.notify_not_write_buffer(current_id)
      return
    end
  end
  M.close(current_id, _force)
end

function M.close_all()
  local ids = vim.api.nvim_list_bufs()
  local has_not_write = M.check_has_not_write_buffer()
  if has_not_write then return end
  for _, _id in ipairs(ids) do
    if vim.api.nvim_buf_is_valid(_id) then
      M.close(_id, false)
    end
  end
end

function M.close_other()
  local ids = vim.api.nvim_list_bufs()
  local current_id = vim.api.nvim_get_current_buf()
  local has_not_write = M.check_has_not_write_buffer()
  if has_not_write then return end
  for _, _id in ipairs(ids) do
    if _id ~= current_id then
      M.close(_id, false)
    end
  end
end

function M.check_has_not_write_buffer()
  local has = false
  local ids = vim.api.nvim_list_bufs()
  for _, _id in ipairs(ids) do
    if vim.api.nvim_buf_is_valid(_id) then
      if vim.api.nvim_get_option_value("modified", { buf = _id }) then
        M.notify_not_write_buffer(_id)
        has = true
      end
    end
  end
  return has
end

function M.notify_not_write_buffer(buffer_id)
  local bufname = vim.api.nvim_buf_get_name(buffer_id)
  local filename = vim.fn.fnamemodify(bufname, ":t")
  vim.notify(filename .. " not saved !!!", vim.log.levels.WARN, { title = "Buffer" })
end

return M
