local M = {}

function M.close(id, _force)
  if not vim.api.nvim_buf_is_valid(id) then return end
  if _force == nil then _force = false end
  vim.api.nvim_buf_delete(id, { force = _force })
end

function M.close_current()
  local current_id = vim.api.nvim_get_current_buf()
  M.close(current_id, false)
end

function M.close_all()
  local ids = vim.api.nvim_list_bufs()
  for _, _id in ipairs(ids) do
    if vim.api.nvim_buf_is_valid(_id) then
      M.close(_id, false)
    end
  end
end

function M.close_other()
  local ids = vim.api.nvim_list_bufs()
  local current_id = vim.api.nvim_get_current_buf()
  for _, _id in ipairs(ids) do
    if _id ~= current_id then
      M.close(_id, false)
    end
  end
end

return M
