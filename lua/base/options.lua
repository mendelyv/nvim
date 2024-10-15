local path_util = require("utils.path")

local M = {
  debug = false,

  -- 插件存放路径
  -- Linux下一般在$HOME/.local/share/nvim/${yourpath}
  -- windows下一般在$HOME/AppData/nvim-data/${yourpath}
  storage_directory = path_util.join(vim.fn.stdpath("data"), "store"),
  -- 语言服务存放路径
  mason_install_directory = path_util.join(vim.fn.stdpath("data"), "mason"),
  -- 代码片段存放路径
  snippets_config_directory = path_util.join(vim.fn.stdpath("config"), "snippets"),
  -- 悬浮窗
  float_border = true,
  -- 透明
  transparent = true,
  -- 禁用的语言服务
  disabled_language_servers = {},
  -- telescope忽略
  telescope_file_ignore_patterns = {},
  -- telescope历史记录数据库路径
  telescope_smart_history_path = path_util.join(vim.fn.stdpath("data"), "databases", "telescope_history.sqlite3"),
  -- nvim-tree忽略，配置这个字段时需要reload一下nvim-tree插件
  nvim_tree_filters_custom = {
    "*.DS_Store",
  },
  -- 补全源
  nvim_cmp_sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
    { name = "cmp_tabnine" },
    { name = "vim-dadbod-completion" },
  },
  -- 是否提示格式化使用的插件
  show_formatter_notify = false,
}

return M
