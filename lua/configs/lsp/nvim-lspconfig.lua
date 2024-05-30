-- https://github.com/neovim/nvim-lspconfig

local path_util = require("utils.path")
local options = require("base.options")
local keymap = require("utils.keymap")
local icons = require("utils.icons").get_icons("diagnostic", true)

local M = {
  requires = {
    "neodev",
    -- "neoconf",
    "lspconfig",
    -- "nvim-navic",
    "mason-lspconfig",
  },
  server_configurations_directory = path_util.join("configs", "lsp", "configurations"),
}

function M.lsp_basic_init()
  M.lsp_handlers = {
    -- 给两个lsp浮动窗添加边框显示
    -- vim.lsp.handlers["textDocument/hover"]: 处理悬停信息请求，例如 vim.lsp.buf.hover()。
    -- vim.lsp.handlers["textDocument/signatureHelp"]: 处理函数参数提示信息请求，例如 vim.lsp.buf.signature_help()。
    -- vim.lsp.handlers["textDocument/definition"]: 处理跳转到定义请求，例如 vim.lsp.buf.definition()。
    -- vim.lsp.handlers["textDocument/references"]: 处理查找引用请求，例如 vim.lsp.buf.references()。
    -- vim.lsp.handlers["textDocument/codeAction"]: 处理代码操作请求，例如 vim.lsp.buf.code_action()。
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = options.float_border and "rounded" or "none",
    }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = options.float_border and "rounded" or "none",
    })
  }

  -- M.capabilities = vim.lsp.protocol.make_client_capabilities()
  M.capabilities = require('cmp_nvim_lsp').default_capabilities()

  -- M.capabilities.textDocument.foldingRange = {
  --   dynamicRegistration = false,
  --   lineFoldingOnly = true,
  -- }

  -- M.capabilities.textDocument.completion.completionItem = {
  --   documentationFormat = { "markdown" },
  --   snippetSupport = true,
  --   preselectSupport = true,
  --   insertReplaceSupport = true,
  --   labelDetailsSupport = true,
  --   deprecatedSupport = true,
  --   commitCharactersSupport = true,
  --   tagSupport = { valueSet = { 1 } },
  --   resolveSupport = {
  --     properties = {
  --       "documentation",
  --       "detail",
  --       "additionalTextEdits",
  --     },
  --   },
  -- }
end

function M.lsp_diagnostic_init()
  vim.diagnostic.config({
    -- 诊断的虚拟文本
    virtual_text = {
      -- disable = true,
      prefix = "●",
      -- 是否总是显示前缀
      source = "always",
      severity = {
        -- 诊断的级别，可选项：'error', 'warning', 'info', 'hint'
        min = vim.diagnostic.severity.ERROR,
      },
    },
    float = {
      -- 是否显示诊断来源
      source = "always",
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

function M.load()
  M.lsp_basic_init()
  M.lsp_diagnostic_init()
  M.neodev.setup({
    override = function(root_dir, library)
      library.enabled = true
      library.plugins = true
    end,
  })

  -- 获取lspconfig和mason对语言服务的名称映射
  local mappings = M.mason_lspconfig.get_mappings()
  -- 获取已经安装的语言服务
  local servers = M.mason_lspconfig.get_installed_servers()

  for _, server_name in ipairs(servers) do
    local config_path = path_util.join(M.server_configurations_directory,
      mappings.lspconfig_to_mason[server_name] or server_name)
    local ok, configuration = pcall(require, config_path)

    -- 将默认的LSP服务配置跟加载后的配置，同名键会被覆盖
    -- 给一个默认的on_attach函数，若语言服务配置文件未指定，则使用默认函数
    configuration = vim.tbl_deep_extend("force", {
      ---@diagnostic disable-next-line: unused-local
      on_init = function(client, bufnr) end,
      ---@diagnostic disable-next-line: unused-local
      on_attach = function(client, bufnr) end,
    }, ok and configuration or {})

    if not vim.tbl_contains(options.disabled_language_servers, server_name) then
      -- 语言服务on_attach回调
      local private_on_attach = configuration.on_attach
      configuration.handlers = M.get_handlers(configuration)
      configuration.capabilities = M.get_capabilities(configuration)
      configuration.on_attach = function(client, bufnr)
        -- M.nvim_navic.attach(client, bufnr)
        private_on_attach(client, bufnr)
      end
      -- 启用语言服务
      M.lspconfig[server_name].setup(configuration)
    end
  end
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
      rhs = vim.lsp.buf.hover,
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

function M.toggle_sigature_help()
  vim.lsp.buf.signature_help()
end

function M.show_line_diagnostic()
  vim.diagnostic.open_float({ border = options.float_border and "rounded" or "none" })
end

function M.goto_prev_diagnostic()
  vim.diagnostic.goto_prev({ float = { border = options.float_border and "rounded" or "none" }, _highest = true })
end

function M.goto_next_diagnostic()
  vim.diagnostic.goto_next({ float = { border = options.float_border and "rounded" or "none" }, _highest = true })
end

function M.get_handlers(settings)
  return vim.tbl_deep_extend("force", M.lsp_handlers, settings.handlers or {})
end

function M.get_capabilities(configuration)
  return vim.tbl_deep_extend("force", M.capabilities, configuration.capabilities or {})
end

return M
