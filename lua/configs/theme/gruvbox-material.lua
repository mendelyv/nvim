-- https://github.com/sainnhe/gruvbox-material

local M = {
  -- requires = {
  --   "gruvbox-material",
  -- },
}

function M.load()
  vim.g.gruvbox_material_background = "soft"
  vim.cmd([[
      " autocmd ColorScheme * hi NormalFloat guifg=#F9E7C0 guibg=#333c43
      " autocmd ColorScheme * hi FloatBorder guifg=#F9E7C0 guibg=#333c43
      " autocmd ColorScheme * hi FloatBorder guifg=#6e7a75 guibg=#333c43
      " autocmd ColorScheme * hi FloatBorder guifg=#859289 guibg=#333c43
      " autocmd ColorScheme * hi FloatBorder guifg=#32302f guibg=#333c43
      autocmd ColorScheme * hi NormalFloat guifg=#F9E7C0 guibg=#32302f
      autocmd ColorScheme * hi FloatBorder guifg=#F9E7C0 guibg=#32302f
    ]]);
  -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#DCA561", bold = true, })
  vim.cmd.colorscheme("gruvbox-material")
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F9E7C0", bold = true, })
end

return M
