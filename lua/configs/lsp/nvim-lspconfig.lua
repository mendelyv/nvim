-- https://github.com/neovim/nvim-lspconfig

local path_util = require("utils.path")
local options = require("base.options")

local M = {
	requires = {
		"lspconfig",
		"mason-lspconfig",
	},
	server_configurations_directory = path_util.join("configs", "lsp", "configurations")
}

function M.load()
	-- 获取lspconfig和mason对语言服务的名称映射
	local mappings = M.mason_lspconfig.get_mappings()
	-- 获取已经安装的语言服务
	local servers = M.mason_lspconfig.get_installed_servers()

	for _, server_name in ipairs(servers) do
		local config_path = path_util.join(M.server_configurations_directory, mappings.lspconfig_to_mason[server_name] or server_name)
		local ok, configuration = pcall(require, config_path)

		-- 将默认的LSP服务配置跟加载后的配置，同名键会被覆盖
		-- 给一个默认的on_attach函数，若语言服务配置文件未指定，则使用默认函数
		configuration = vim.tbl_deep_extend("force", {
			on_attach = function(client, bufnr) end,
		}, ok and configuration or {})

		if not vim.tbl_contains(options.disabled_language_servers, server_name) then
			-- 语言服务on_attach回调
			local private_on_attach = configuration.on_attach
			configuration.on_attach = function(client, bufnr)
				private_on_attach(client, bufnr)
			end
			-- 启用语言服务
			M.lspconfig[server_name].setup(configuration)
		end
	end
end

return M
