-- https://github.com/nvim-telescope/telescope.nvim

local keymap = require("utils.keymap");
local M = {
    requires = {
        "telescope",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.telescope.setup({
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            entry_prefix = " ",
            multi_icon = " ",
            color_devicons = true,
            file_ignore_patterns = { "node_modules" },
            -- theme
            layout_strategy = "vertical",
	    -- path_display = { "tail" },
        },
        pickers = {
            buffers = {
                mappings = {
                    i = {
                        ["<c-d>"] = "delete_buffer",
                    },
                    n = {
                        ["dd"] = "delete_buffer",
                    },
                },
            },
        },
    })
end

function M.after()
end

function M.register_key()
    keymap.register_all({
        {
            mode = { "n" },
            lhs = "<leader>ff",
            rhs = function()
                require("telescope.builtin").find_files()
            end,
            options = { silent = true },
            description = "Find files in the current workspace",
        },
        {
            mode = { "n" },
            lhs = "<leader>fg",
            rhs = function()
                require("telescope.builtin").live_grep()
            end,
            options = { silent = true },
            description = "Find string in the current workspace",
        },
        {
            mode = { "n" },
            lhs = "<leader>fo",
            rhs = function()
                require("telescope.builtin").oldfiles()
            end,
            options = { silent = true },
            description = "Find telescope history",
        },
        {
            mode = { "n" },
            lhs = "<leader>fh",
            rhs = function()
                require("telescope.builtin").resume()
            end,
            options = { silent = true },
            description = "Find last lookup",
        },
        {
            mode = { "n" },
            lhs = "<leader>ft",
            rhs = function()
                require("telescope.builtin").help_tags()
            end,
            options = { silent = true },
            description = "Find all help document tags",
        },
        {
            mode = { "n" },
            lhs = "<leader>fm",
            rhs = function()
                require("telescope.builtin").marks()
            end,
            options = { silent = true },
            description = "Find marks in the current workspace",
        },
        {
            mode = { "n" },
            lhs = "<leader>fi",
            rhs = function()
                require("telescope.builtin").highlights()
            end,
            options = { silent = true },
            description = "Find all neovim highlights",
        },
        {
            mode = { "n" },
            lhs = "<leader>fb",
            rhs = function()
                require("telescope.builtin").buffers()
            end,
            options = { silent = true },
            description = "Find all buffers",
        },
        {
            mode = { "n" },
            lhs = "<leader>f/",
            rhs = function()
                require("telescope.builtin").search_history()
            end,
            options = { silent = true },
            description = "Find all search history",
        },
        {
            mode = { "n" },
            lhs = "<leader>f:",
            rhs = function()
                require("telescope.builtin").command_history()
            end,
            options = { silent = true },
            description = "Find all command history",
        },
    })
end

return M
