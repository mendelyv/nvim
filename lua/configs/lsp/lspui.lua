-- https://github.com/jinzhongjia/LspUI.nvim

local nvim_lspconfig = require("configs.lsp.nvim-lspconfig")
local M = {
  requires = {
    "LspUI",
  }
}

function M.load()
  M.lspui.setup()
end

function M.after()
  nvim_lspconfig.after_lspsaga()
end

return M
