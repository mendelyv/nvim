-- https://github.com/folke/flash.nvim

local M = {
	requires = {
		"flash",
	},
}

function M.load()
	M.flash.setup({
		modes = {
			search = {
				highlight = { backdrop = true },
			},
			char = {
				multi_line = false,
			}
		}
	})
end

return M
