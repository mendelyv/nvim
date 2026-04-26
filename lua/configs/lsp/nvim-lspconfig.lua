-- https://github.com/neovim/nvim-lspconfig

local path_util = require("utils.path")
local options = require("base.options")
local keymap = require("utils.keymap")
local icons = require("utils.icons").get_icons("diagnostic", true)
local utils = require("utils.utils")

local M = {
  requires = {
    "lspconfig",
    "mason-lspconfig",
  },
  server_configurations_directory = path_util.join("configs", "lsp", "configurations"),
}

function M.lsp_diagnostic_init()
  vim.diagnostic.config({
    -- 诊断的虚拟文本
    virtual_text = {
      -- disable = true,
      prefix = "●",
      -- 是否总是显示前缀
      -- source = "always",
      severity = {
        -- 诊断的级别，可选项：'error', 'warning', 'info', 'hint'
        min = vim.diagnostic.severity.ERROR,
      },
    },
    float = {
      -- 是否显示诊断来源
      -- source = "always",
    },
    -- 在插入模式下是否显示诊断
    update_in_insert = false,
    -- 开启诊断按优先级排序
    severity_sort = true,
  })

  for _type, icon in pairs(icons) do
    local hl = ("DiagnosticSign%s"):format(_type)
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

function M.enable_all_clients()
  -- 获取 lspconfig 和 mason 对语言服务的名称映射
  local mappings = M.mason_lspconfig.get_mappings()
  -- 获取已经安装的语言服务
  local servers = M.mason_lspconfig.get_installed_servers()

  for _, server_name in ipairs(servers) do
    local server_mason_name = mappings.lspconfig_to_package[server_name] or server_name;
    if options.lsp_debug then vim.print(server_name .. " language server mapping name " .. server_mason_name) end
    local config_path = path_util.join(M.server_configurations_directory, server_mason_name);

    -- custom workspace
    if options.workspace_language_configurations then
      local convert_mason_name = utils.replace_dot_and_center_line_char_to_underline(server_mason_name);
      if options.workspace_language_configurations[convert_mason_name] then
        config_path = options.workspace_language_configurations[convert_mason_name]
      end
    end

    if options.lsp_debug then vim.print(server_name .. " 语言服务配置路径 " .. config_path) end
    local ok, configuration = pcall(require, config_path)
    if options.lsp_debug and not ok then vim.print(server_name .. " 语言服务配置加载失败 " .. config_path) end
    if not vim.tbl_contains(options.disabled_language_servers, server_mason_name) then
      -- 合并语言服务配置
      if ok then vim.lsp.config(server_name, configuration) end
      -- 启用语言服务
      vim.lsp.enable(server_name)
    end
  end
end

function M.load()
  M.lsp_diagnostic_init()
  M.enable_all_clients()
end

function M.after()
  M.register_key()
end

function M.register_key()
  keymap.register_all({
    {
      mode = { "n" },
      lhs = "<leader>ca",
      rhs = vim.lsp.buf.code_action,
      options = { silent = true },
      description = "Show code action",
    },
    {
      mode = { "n" },
      lhs = "<leader>cn",
      rhs = vim.lsp.buf.rename,
      options = { silent = true },
      description = "Variable renaming",
    },
    {
      mode = { "n" },
      lhs = "gh",
      rhs = M.hover,
      options = { silent = true },
      description = "Show help information",
    },
    {
      mode = { "n" },
      lhs = "gr",
      rhs = function()
        require("telescope.builtin").lsp_references({
          fname_width = 200,
          show_line = false,
        })
      end,
      options = { silent = true },
      description = "Go to references",
    },
    {
      mode = { "n" },
      lhs = "gR",
      rhs = vim.lsp.buf.references,
      options = { silent = true },
      description = "Go to references",
    },
    {
      mode = { "n" },
      lhs = "gd",
      rhs = function()
        require("telescope.builtin").lsp_definitions({
          fname_width = 200,
          show_line = false,
        })
      end,
      options = { silent = true },
      description = "Go to definitions",
    },
    {
      mode = { "n" },
      lhs = "go",
      rhs = function()
        require("telescope.builtin").diagnostics({
          line_width = 200,
          bufnr = 0,
        })
      end,
      options = { silent = true },
      description = "Show Buffer Diagnostics",
    },
    {
      mode = { "n" },
      lhs = "gO",
      rhs = function()
        require("telescope.builtin").diagnostics({
          line_width = 200,
        })
      end,
      options = { silent = true },
      description = "Show Workspace Diagnostics",
    },
    {
      mode = { "n" },
      lhs = "g[",
      rhs = M.goto_prev_diagnostic,
      options = { silent = true },
      description = "Jump to prev diagnostic",
    },
    {
      mode = { "n" },
      lhs = "g]",
      rhs = M.goto_next_diagnostic,
      options = { silent = true },
      description = "Jump to next diagnostic",
    },
    {
      mode = { "n" },
      lhs = "gl",
      rhs = M.show_line_diagnostic,
      options = { silent = true },
      description = "Show current line disgnostics",
    },
    {
      mode = { "i" },
      lhs = "<c-j>",
      rhs = M.toggle_sigature_help,
      options = { silent = true },
      description = "Toggle signature help",
    },
  })
end

function M.hover()
  vim.lsp.buf.hover({ border = options.float_border and "rounded" or "none" })
end

function M.toggle_sigature_help()
  vim.lsp.buf.signature_help({ border = options.float_border and "rounded" or "none" })
end

function M.show_line_diagnostic()
  vim.diagnostic.open_float({ border = options.float_border and "rounded" or "none" })
end

function M.goto_prev_diagnostic()
  vim.diagnostic.jump({
    count = -1,
    float = { border = options.float_border and "rounded" or "none" },
    _highest = true,
  })
end

function M.goto_next_diagnostic()
  vim.diagnostic.jump({
    count = 1,
    float = { border = options.float_border and "rounded" or "none" },
    _highest = true,
  })
end

return M
