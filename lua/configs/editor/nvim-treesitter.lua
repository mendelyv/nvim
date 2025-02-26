-- https://github.com/nvim-treesitter/nvim-treesitter

local M = {
  requires = {
    "nvim-treesitter.configs",
    "nvim-treesitter.install",
  },
}

function M.before() end

function M.load()
  M.nvim_treesitter_install.prefer_git = true
  M.nvim_treesitter_install.compilers = { "clang" }
  M.nvim_treesitter_configs.setup({
    ensure_installed = {

    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = false,
      -- disable = { "yaml", "python", "html", "vue" },
    },
    -- incremental selection
    incremental_selection = {
      enable = false,
      keymaps = {
        init_selection = "<cr>",
        node_incremental = "<cr>",
        node_decremental = "<bs>",
        scope_incremental = "<tab>",
      },
    },
    -- nvim-ts-autotag
    autotag = {
      enable = true,
    },
    -- nvim-ts-context-commentstring
    -- context_commentstring = {
    --   enable = true,
    --   enable_autocmd = false,
    -- },
  })
end

function M.after() end

return M
