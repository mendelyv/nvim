-- https://github.com/nvim-telescope/telescope.nvim

local keymap = require("utils.keymap")
local options = require("base.options")

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
      file_ignore_patterns = options.telescope_file_ignore_patterns,
      -- theme
      layout_strategy = "vertical",
      layout_config = {
        vertical = {
          preview_height = 0.6,
        },
        flex = {
          flip_columns = 120,
        },
      },
      path_display = { "smart" },
      history = {
        path = options.telescope_smart_history_path,
        limit = 100,
      },
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
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      frecency = {
        auto_validate = false,
        matcher = "fuzzy",
        path_display = { "filename_first" },
      },
      live_grep_args = {
        auto_quoting = true, -- enable/disable auto-quoting
      },
    },
  })
end

function M.after()
  M.telescope.load_extension("fzf")
  M.telescope.load_extension("yank_history")
  M.telescope.load_extension("smart_history")
  M.telescope.load_extension("frecency")
  M.telescope.load_extension("live_grep_args")

  -- 预览界面内容换行
  vim.api.nvim_create_autocmd("User", {
    pattern = "TelescopePreviewerLoaded",
    callback = function()
      vim.wo.wrap = true
    end
  })

  -- 预览界面开启行号
  vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
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
        require("telescope").extensions.live_grep_args.live_grep_args()
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
      lhs = "<leader>f\'",
      rhs = function()
        require("telescope.builtin").marks()
      end,
      options = { silent = true },
      description = "Find marks in the current workspace",
    },
    {
      mode = { "n" },
      lhs = "<leader>f\"",
      rhs = function()
        require("telescope.builtin").registers()
      end,
      options = { silent = true },
      description = "Show all registers",
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
    {
      mode = { "n" },
      lhs = "<leader>fs",
      rhs = function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      options = { silent = true },
      description = "Find symbols in the current buffer",
    },
    {
      mode = { "n" },
      lhs = "<leader>fS",
      rhs = function()
        require("telescope.builtin").lsp_workspace_symbols()
      end,
      options = { silent = true },
      description = "Find symbols in the current workspace",
    },
    {
      mode = { "n" },
      lhs = "<leader>afk",
      rhs = function()
        require("telescope.builtin").keymaps()
      end,
      options = { silent = true },
      description = "Find keyboard shortcut",
    },
  })
end

return M
