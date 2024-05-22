-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#omnisharp

local util = require("lspconfig.util")

local root_files = {
  "*.sln",
  "*.csproj",
  "omnisharp.json",
  "function.json",
}

return {
  cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
  root_dir = function(fname)
    ---@diagnostic disable-next-line: deprecated
    return util.root_pattern(unpack(root_files))(fname)
  end,
  -- For go_to_definition to work fully, extended textDocument/definition handler is needed
  -- https://github.com/Hoffs/omnisharp-extended-lsp.nvim
  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
    ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
    ["textDocument/references"] = require('omnisharp_extended').references_handler,
    ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
  },
}
