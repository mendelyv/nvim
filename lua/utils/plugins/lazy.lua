-- https://github.com/folke/lazy.nvim
-- Lazy插件管理器模块

local path_util = require("utils.path")
local options = require("base.options")
local common = require("utils.common")

local M = {
  plugin_config_root_directory = "configs"
}

-- 获取Lazy配置，详情见help或github
function M.get_options()
  return {
    -- 插件安装根目录
    root = options.storage_directory,
    install = {
      colorscheme = { "desert" },
    },
    ui = {
      border = options.float_border and "double" or "none",
    }
  }
end

-- Lazy初始化，详情见github
function M.before()
  local lazypath = path_util.join(options.storage_directory, "lazy.nvim")
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.runtimepath:prepend(lazypath)
  M.lazy = require("lazy")
end

function M.load(plugins)
  local load_modules = {}
  -- 遍历插件模块，通过类型，获取该类型下的插件
  -- plugin_kind_name 是键（key），plugin_kind_tbl 是值（value）
  for plugin_kind_name, plugin_kind_tbl in pairs(plugins) do
    for _, plugin_options in ipairs(plugin_kind_tbl) do
      -- plugin_options.name 是插件配置信息中的一个字段，表示插件模块的文件名。如果该字段不存在，则从 plugin_options[1] 字段中提取出文件名
      local file_name = (plugin_options.name or plugin_options[1]:match("/([%w%-_]+).?")):lower()
      -- 拼接插件配置文件路径
      local config_file_path = path_util.join(M.plugin_config_root_directory, plugin_kind_name, file_name)
      if options.debug then
        vim.print('插件配置路径' .. config_file_path)
      end
      -- 尝试加载插件配置模块
      local ok, module = pcall(require, config_file_path)
      if ok then
        -- 插件初始化方法，注意插件的config模块生命周期函数要与此一致
        plugin_options.init = function()
          -- 插件配置模块生命周期函数
          if module.before then
            module.before()
          end
        end

        -- 加载插件配置依赖
        plugin_options.config = function()
          common.require_packages(module)
          -- 插件配置模块生命周期函数
          if module.load then
            module.load()
          end
          if module.after then
            module.after()
          end
        end
      else
        if options.debug then
          vim.print(file_name .. '配置加载失败，插件配置路径' .. config_file_path)
        end
      end
      table.insert(load_modules, plugin_options)
    end
  end
  M.lazy.setup(load_modules, M.get_options())
end

function M.after() end

function M.entry(plugins)
  M.before()
  M.load(plugins)
  M.after()
end

return M
