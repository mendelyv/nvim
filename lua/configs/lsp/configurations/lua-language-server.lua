-- https://github.com/sumneko/lua-language-server

return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  -- 允许将 LSP 用于单个文件而不仅限于整个项目
  single_file_support = true,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
