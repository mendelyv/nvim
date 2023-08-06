local M = {}

function M.before() end

function M.load()
  vim.cmd [[colorscheme everforest]]
end

function M.after()
  vim.g.everforest_background = 'soft'
end

return M
