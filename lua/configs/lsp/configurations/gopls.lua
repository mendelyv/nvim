-- https://github.com/golang/tools/tree/master/gopls

return {
  cmd = { "gopls" },
  single_file_support = true,
  filetypes = { "go", "gomod", "gotmpl" },
}
