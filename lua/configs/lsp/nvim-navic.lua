-- https://github.com/SmiteshP/nvim-navic

local icons = require("utils.icons").get_icons("lsp_kind", true)

local M = {
	requires = {
		"nvim-navic",
	},
}

function M.before()
	M.ignore_filetype = {
		"markdown",
		"gitcommit"
	}
end

function M.load()
	M.nvim_navic.setup({
		icons = icons,
		highlight = true,
		separator = " > ",
	})
end

function M.after()
	vim.api.nvim_create_autocmd(
		{ "DirChanged", "CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter", "BufNewFile" },
		{
			callback = function()
				if not vim.bo.buflisted or vim.tbl_contains(M.ignore_filetype, vim.bo.filetype) then
					vim.opt_local.winbar = ""
				else
					vim.opt_local.winbar = "%{%v:lua.require('nvim-navic').get_location()%}"
				end
			end,
		}
	)
end

return M
