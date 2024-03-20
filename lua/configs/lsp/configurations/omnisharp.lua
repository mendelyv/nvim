-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#omnisharp

local util = require("lspconfig.util")

local root_files = {
  "*.sln",
  "*.csproj",
  "omnisharp.json",
  "function.json",
}

return {
  root_dir = function(fname)
    ---@diagnostic disable-next-line: deprecated
    return util.root_pattern(unpack(root_files))(fname)
  end,
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
}
