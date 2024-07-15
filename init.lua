vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 命令行启动配置
local common = require("utils.common")
if common.is_windows() then
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

require("base.setting")
require("base.plugins")
require("base.mapping")
