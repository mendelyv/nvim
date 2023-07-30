-- https://github.com/akinsho/bufferline.nvim

local keymap = require("utils.keymap")
local icons = require("utils.icons").get_icons("diagnostic_thin", true)

local M = {
	requires = {
		"bufferline",
	},
}

function M.load()
	M.bufferline.setup({
		options = {
			show_close_icon = false,
			show_buffer_close_icon = false,
			buffer_close_icon = "",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "center",
				},
			},
			diagnostics = "nvim_lsp",
			---@diagnostic disable-next-line: unused-local
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local message
				if diagnostics_dict.error then
					message = ("%s%s"):format(icons.Error, diagnostics_dict.error)
				elseif diagnostics_dict.warning then
					message = ("%s%s"):format(icons.Warn, diagnostics_dict.warning)
				elseif diagnostics_dict.info then
					message = ("%s%s"):format(icons.Info, diagnostics_dict.info)
				elseif diagnostics_dict.hint then
					message = ("%s%s"):format(icons.Hint, diagnostics_dict.hint)
				else
					message = ""
				end
				return message
			end,
		},
	})
end

function M.after()
	M.register_keys()
end

function M.register_keys()
	keymap.register_all({
		{
			mode = { "n" },
			lhs = "<leader>bp",
			rhs = "<cmd>BufferLinePickClose<cr>",
			options = { silent = true },
			description = "Close choose buffer",
		},
		{
			mode = { "n" },
			lhs = "<c-l>",
			rhs = "<cmd>BufferLineCycleNext<cr>",
			options = { silent = true },
			description = "Go to right buffer",
		},
		{
			mode = { "n" },
			lhs = "<c-h>",
			rhs = "<cmd>BufferLineCyclePrev<cr>",
			options = { silent = true },
			description = "Go to left buffer",
		},
		{
			mode = { "n" },
			lhs = "<leader>bh",
			rhs = "<cmd>BufferLineMovePrev<cr>",
			options = { silent = true },
			description = "Move current buffer to left",
		},
		{
			mode = { "n" },
			lhs = "<leader>bl",
			rhs = "<cmd>BufferLineMoveNext<cr>",
			options = { silent = true },
			description = "Move current buffer to right",
		},
		{
			mode = { "n" },
			lhs = "<leader>bo",
			rhs = "<cmd>BufferLineCloseOthers<cr>",
			options = { silent = true },
			description = "Close all other buffers",
		},
	})
end

return M