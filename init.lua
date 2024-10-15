vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--- 配置windows下bash启动
local function config_windows_bash()
  local bash_options = {
    -- shell = "C:\\Program Files\\Git\\bin\\bash.exe",
    shell = "bash.exe",
    -- shellcmdflag = "--login -i -c",
    shellcmdflag = "-s -c",
    shellredir = "",
    shellpipe = "2>&1",
    shellquote = "",
    shellxquote = "",
  }

  for option, value in pairs(bash_options) do
    vim.opt[option] = value
  end
end

local function init_sqlite()
  vim.g.sqlite_clib_path = "C:\\Program Files\\sqlite\\sqlite3.dll"
end

-- 命令行启动配置
local common = require("utils.common")
if common.is_windows() then
  config_windows_bash()
  init_sqlite()
end


require("base.setting")
require("base.plugins")
require("base.mapping")
