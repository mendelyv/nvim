-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md

---@diagnostic disable: param-type-mismatch

local options = require("base.options")

local M = {
	requires = {
		"mason",
		"mason-registry",
	},
}

function M.before()
	M.installer_table = {}
end

function M.load()
	M.mason.setup({
		install_root_dir = options.mason_install_directory,
	})
end

function M.auto_install()
	local installed = {}
	for _, kind in pairs(M.installer_table) do
		for _, name_version in pairs(kind) do
			-- 根据@裁切要安装的语言服务名称和版本
			local name, version = unpack(vim.split(name_version, "@"))
			if not M.mason_registry.is_installed(name) then
				if not M.mason_registry.has_package(name) then
					vim.notify(("Invalid package name : %s"):format(name), "ERROR", { title = "Mason" })
				else
					local params = version and { version = version }
					M.mason_registry.get_package(name):install(params)
					table.insert(installed, name_version)
				end
			end
		end
	end

	if not vim.tbl_isempty(installed) then
		        vim.notify(
            ("Start install package : \n - %s"):format(table.concat(installed, "\n - ")),
            "INFO",
            { title = "Mason" }
        )
	end
end


return M
