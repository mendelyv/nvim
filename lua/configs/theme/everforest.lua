local M = {}

function M.load()
  vim.g.everforest_background = 'soft'
  vim.g.everforest_disable_italic_comment = 1
  vim.g.everforest_better_performance = 1
  -- vim.g.everforest_current_word = "bold"
  -- vim.g.everforest_colors_override = {
  --   grey0 = {"#ff0000", "243"},
  --   grey1 = {"#00ff00", "245"},
  --   grey2 = {"#0000ff", "247"},
  -- }
  vim.cmd([[
      " autocmd ColorScheme * hi NormalFloat guifg=#F9E7C0 guibg=#333c43
      " autocmd ColorScheme * hi FloatBorder guifg=#F9E7C0 guibg=#333c43
      " autocmd ColorScheme * hi FloatBorder guifg=#6e7a75 guibg=#333c43
      " autocmd ColorScheme * hi NormalFloat guifg=#d3c6aa guibg=#333c43
      autocmd ColorScheme * hi NormalFloat guibg=#333c43
      autocmd ColorScheme * hi FloatBorder guifg=#859289 guibg=#333c43
    ]]);

  vim.cmd.colorscheme("everforest")

  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#DCA561", bold = true, })
  -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F9E7C0", bold = true, })
  -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FF9E3B", bold = true, })
end

return M
