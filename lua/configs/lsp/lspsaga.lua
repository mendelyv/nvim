-- https://github.com/nvimdev/lspsaga.nvim

local nvim_lspconfig = require("configs.lsp.nvim-lspconfig")

local M = {
	requires = {
		"lspsaga",
	},
}

function M.load()
	M.lspsaga.setup({
		border_style = "round",
		diagnostic_header_icon = " ",
		-- 正在写入的行提示
		code_action_icon = " ",
		code_action_prompt = {
			-- 显示写入行提示
			-- 如果为 true ，则写代码时会在左侧行号栏中显示你所定义的图标
			enable = false,
			sign = true,
			sign_priority = 40,
			virtual_text = true,
		},
		-- 快捷键配置
		code_action_keys = {
			quit = "<Esc>",
			exec = "<CR>",
		},
		rename_action_keys = {
			quit = "<Esc>",
			exec = "<CR>",
		},
	})
end

function M.after()
	nvim_lspconfig.after_lspsaga()
end

return M
