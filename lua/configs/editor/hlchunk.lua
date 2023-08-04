-- https://github.com/shellRaining/hlchunk.nvim

local M = {
	requires = {
		"hlchunk",
	}
}

function M.load()
	M.hlchunk.setup({
		chunk = {
			style = {
				{ fg = "#676767" },
			},
			notify = false,
		},
		indent = {
			enable = false,
		},
		line_num = {
			style = "#999999",
		},
		blank = {
			enable = false,
		}
	})
end

return M
