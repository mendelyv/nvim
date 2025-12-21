local M = {}

function M.overwrite_cursor_line_number_highlight()
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#DCA561", bold = true, })
end

function M.overwrite_float_highlight()
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#333c43" })
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#859289", bg = "#333c43" })
end

function M.overwrite_alpha_plugin_highlight()
  vim.api.nvim_set_hl(0, "DashboardLogo1", { fg = "#83C092" })
end

function M.overwrite_indent_blankline_plugin_highlight()
  vim.api.nvim_set_hl(0, "@ibl.scope.char.1", { fg = "#B5B5B5" })
end

function M.overwrite_blink_plugin_highlight()
  vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "#333c43" })
  vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#859289", bg = "#333c43" })
  vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#859289", bg = "#333c43" })
  vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = "#859289", bg = "#333c43" })
end

function M.overwrite_all_highlight()
  M.overwrite_float_highlight()
  M.overwrite_cursor_line_number_highlight()
  M.overwrite_alpha_plugin_highlight()
  M.overwrite_indent_blankline_plugin_highlight()
  M.overwrite_blink_plugin_highlight()
end

return M
