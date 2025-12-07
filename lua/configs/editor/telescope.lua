-- https://github.com/nvim-telescope/telescope.nvim

local keymap = require("utils.keymap")
local options = require("base.options")
local path = require("utils.path")

local M = {
  requires = {
    "telescope",
    "telescope.utils",
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
          height = 0.9,
          width = 0.9,
        },
        flex = {
          flip_columns = 120,
        },
      },
      path_display = { "filename_first" },
      cache_picker = {
        num_pickers = 20,
      },
    },
    pickers = {
      buffers = {
        entry_maker = function(entry)
          local bufnr = entry.bufnr
          local bufnr_str = tostring(bufnr)
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          local relpath = bufname ~= "" and vim.fn.fnamemodify(bufname, ":.") or "[No Name]"
          local filename = vim.fn.fnamemodify(bufname, ":t")
          local icon, hl_group = M.telescope_utils.get_devicons(filename, false)

          local hidden = entry.info.hidden == 1 and "h" or " "
          local readonly = vim.api.nvim_get_option_value("readonly", { buf = entry.bufnr }) and "=" or " "
          local changed = entry.info.changed == 1 and "+" or " "
          local indicator = entry.flag .. hidden .. readonly .. changed

          local lnum = 1
          if entry.info.lnum ~= 0 then
            if vim.api.nvim_buf_is_loaded(bufnr) then
              local line_count = vim.api.nvim_buf_line_count(bufnr)
              lnum = math.max(math.min(entry.info.lnum, line_count), 1)
            else
              lnum = entry.info.lnum
            end
          end

          local file_with_line = filename
          file_with_line = string.format("%s:%s", filename, lnum)

          local display_relative_path = path.trim_filename(relpath);
          local displayer = require("telescope.pickers.entry_display").create({
            separator = " ",
            items = {
              { width = 4 },
              { width = 4 },
              { width = 2 },
              { width = #file_with_line + 1 },
              { remaining = true },
            },
          })

          return {
            value = bufnr,
            ordinal = filename .. relpath,
            display = function()
              return displayer({
                { bufnr_str,             "TelescopeResultsNumber", },
                { indicator,             "TelescopeResultsComment" },
                { icon,                  hl_group },
                { file_with_line },
                { display_relative_path, "Comment" }
              })
            end,
            bufnr = bufnr,
            path = bufname,
          }
        end,
        mappings = {
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
        require("telescope.builtin").find_files({
          hidden = true,
        })
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
      lhs = "<leader>aft",
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
    {
      mode = { "n" },
      lhs = "<leader>fp",
      rhs = function()
        require("telescope.builtin").pickers()
      end,
      options = { silent = true },
      description = "Show query history",
    },
    {
      mode = { "n" },
      lhs = "<leader>fj",
      rhs = function()
        require("telescope.builtin").jumplist()
      end,
      options = { silent = true },
      description = "Show jump list",
    },
    {
      mode = { "n" },
      lhs = "<leader>fz",
      rhs = function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      options = { silent = true },
      description = "Show buffer fuzzy find",
    },
  })
end

return M
