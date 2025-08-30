-- https://github.com/nvim-lualine/lualine.nvim

local utils = require("utils.utils")

local colors = {
  insert_bg  = '#D3C6AA',
  visual_bg  = '#E67E80',
  black      = '#080808',
  white      = '#c6c6c6',
  replace_bg = '#ff5189',
  normal_bg  = '#A7C080',
  grey       = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.normal_bg },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.insert_bg } },
  visual = { a = { fg = colors.black, bg = colors.visual_bg } },
  replace = { a = { fg = colors.black, bg = colors.replace_bg } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

local M = {
  requires = {
    "lualine",
  },
}

function M.before() end

function M.load()
  local configuration = {}
  M.setLualineTheme(configuration)
  M.lualine.setup(configuration)
end

--- 设置 lualine 主题
---@param configuration
function M.setLualineTheme(configuration)
  local options = {
    theme = bubbles_theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  }
  if configuration.options == nil then
    configuration.options = options
  else
    utils.table_merge(configuration.options, options)
  end

  local sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {
      '%=', --[[ add your center components here in place of this comment ]]
    },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  }
  if configuration.sections == nil then
    configuration.sections = sections
  else
    utils.table_merge(configuration.sections, sections)
  end

  local inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  }
  if configuration.inactive_sections == nil then
    configuration.inactive_sections = inactive_sections;
  else
    utils.table_merge(configuration.inactive_sections, inactive_sections)
  end

  local tabline = {}
  local extensions = {}
end

function M.after() end

return M
