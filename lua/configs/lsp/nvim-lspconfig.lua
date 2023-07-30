-- https://github.com/neovim/nvim-lspconfig

local path_util = require("utils.path")
local options = require("base.options")
local keymap = require("utils.keymap")
local icons = require("utils.icons").get_icons("diagnostic", true)

local M = {
	requires = {
		"lspconfig",
		"mason-lspconfig",
		"nvim-navic",
	},
	server_configurations_directory = path_util.join("configs", "lsp", "configurations")
}

function M.load()
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
			on_attach = function(client, bufnr) end,
		}, ok and configuration or {})

		if not vim.tbl_contains(options.disabled_language_servers, server_name) then
			-- 语言服务on_attach回调
			local private_on_attach = configuration.on_attach
			configuration.on_attach = function(client, bufnr)
				M.nvim_navic.attach(client, bufnr)
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

-- lspsaga后配置，不然会被lspsaga默认配置覆盖
function M.after_lspsaga()
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

function M.register_key()
	keymap.register_all({
		{
			mode = { "n" },
			lhs = "<leader>ca",
			rhs = "<cmd>Lspsaga code_action<cr>",
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
			lhs = "<leader>cf",
			rhs = function()
				vim.lsp.buf.format({ async = true })
			end,
			options = { silent = true },
			description = "Format buffer",
		},
		{
			mode = { "n" },
			lhs = "gh",
			rhs = "<cmd>Lspsaga hover_doc<cr>",
			options = { silent = true },
			description = "Show help information",
		},
		{
			mode = { "n" },
			lhs = "gr",
			rhs = function()
				require("telescope.builtin").lsp_references()
			end,
			options = { silent = true },
			description = "Go to references",
		},
		{
			mode = { "n" },
			lhs = "gi",
			rhs = function()
				require("telescope.builtin").lsp_implementations()
			end,
			options = { silent = true },

			description = "Go to implementations",
		},
		{
			mode = { "n" },
			lhs = "gd",
			rhs = function()
				require("telescope.builtin").lsp_definitions()
			end,
			options = { silent = true },
			description = "Go to definitions",
		},
		{
			mode = { "n" },
			lhs = "gD",
			rhs = function()
				require("telescope.builtin").lsp_type_definitions()
			end,
			options = { silent = true },
			description = "Go to type definitions",
		},
		{
			mode = { "n" },
			lhs = "go",
			rhs = function()
				require("telescope.builtin").diagnostics()
			end,
			options = { silent = true },
			description = "Show Workspace Diagnostics",
		},
		{
			mode = { "n" },
			lhs = "g[",
			rhs = "<cmd>Lspsaga diagnostic_jump_prev<cr>",
			options = { silent = true },
			description = "Jump to prev diagnostic",
		},
		{
			mode = { "n" },
			lhs = "g]",
			rhs = "<cmd>Lspsaga diagnostic_jump_next<cr>",
			options = { silent = true },
			description = "Jump to next diagnostic",
		},
		{
			mode = { "n" },
			lhs = "gl",
			rhs = "<cmd>Lspsaga show_line_diagnostics<cr>",
			options = { silent = true },
			description = "Show current line disgnostics",
		},
	})
end

return M
