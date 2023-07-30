-- https://github.com/rcarriga/nvim-notify

local icons = require("utils.icons").get_icons("diagnostic", true)
local keymap = require("utils.keymap")
local options = require("base.options")

local M = {
	requires = {
		"notify",
	},
}

function M.before() end

function M.load()
	M.notify.setup({
		stages = "slide",
		timeout = 3000,
		icons = {
			ERROR = icons.Error,
			WARN = icons.Warn,
			INFO = icons.Hint,
		},
		background_colour = options.transparent and "#000000" or "Normal"
	})
end

function M.after()
	M.register_keys()
	vim.notify = M.notify
end

function M.register_keys()
	keymap.register_all({
		{
			mode = { "n" },
			lhs = "<leader>fn",
			rhs = ":Notifications<cr>",
			options = { silent = true },
			description = "Show notices history",
		}
	})
end

return M
