local M = {}

function M.load()
  vim.g.everforest_background = 'soft'
  vim.g.everforest_disable_italic_comment = 1
  -- vim.g.everforest_current_word = "bold"
  -- vim.g.everforest_colors_override = {
  --   grey0 = {"#ff0000", "243"},
  --   grey1 = {"#00ff00", "245"},
  --   grey2 = {"#0000ff", "247"},
  -- }
  vim.cmd [[colorscheme everforest]]
end

return M
