-- https://github.com/sumneko/lua-language-server

local util = require("lspconfig.util")

local root_files = {
  ".luarc.json",
  ".luacheckrc",
  ".stylua.toml",
  "selene.toml",
}

return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  -- 允许将 LSP 用于单个文件而不仅限于整个项目
  single_file_support = true,
  root_dir = function(fname)
    ---@diagnostic disable-next-line: deprecated
    return util.root_pattern(unpack(root_files))(fname)
  end,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
