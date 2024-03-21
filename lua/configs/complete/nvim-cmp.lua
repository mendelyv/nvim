-- https://github.com/hrsh7th/cmp-cmdline
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/saadparwaiz1/cmp_luasnip
-- https://github.com/kristijanhusak/vim-dadbod-completion
-- https://github.com/tzachar/cmp-tabnin

local icons = require("utils.icons").get_icons("lsp_kind", false)
local options = require("base.options")

local M = {
  requires = {
    "cmp",
    "cmp.types",
    "luasnip",
  }
}

function M.before()
  M.complete_window_settings = {
    fixed = true,
    min_width = 15,
    max_width = 50,
  }
  M.duplicate_keywords = {
    ["luasnip"] = 1,
    ["nvim_lsp"] = 1,
    ["buffer"] = 0,
    ["path"] = 0,
    ["cmdline"] = 0,
    ["cmp_tabnine"] = 0,
    ["vim-dadbod-completion"] = 0,
  }
end

function M.load()
  M.cmp.setup({
    -- 设置预选（preselect）模式为 None，禁用自动选择最高优先级的候选项
    preselect = M.cmp_types.cmp.PreselectMode.None,
    -- 设置默认确认行为为插入模式（Insert），即在按下回车键时插入补全项
    confirmation = {
      default_behavior = M.cmp.ConfirmBehavior.Insert,
    },
    -- 配置代码片段（snippet）的展开函数，用于在补全时展开代码片段
    snippet = {
      expand = function(args)
        M.luasnip.lsp_expand(args.body)
      end,
    },
    -- 定义补全源
    sources = options.nvim_cmp_sources;
    mapping = {
      ["<cr>"] = M.confirm(),
      ["<c-p>"] = M.select_prev_item(),
      ["<c-n>"] = M.select_next_item(),
      -- ["<c-b>"] = M.scroll_docs(-5),
      -- ["<c-f>"] = M.scroll_docs(5),
      ["<tab>"] = M.confirm_select(),
      -- ["<c-u>"] = M.select_prev_n_item(5),
      -- ["<c-d>"] = M.select_next_n_item(5),
      ["<c-k>"] = M.toggle_complete_menu(),
    },
    -- 定义补全菜单中候选项的排序规则，包括按照位置、完全匹配度、得分、最近使用、局部匹配度、类型等排序方式
    sorting = {
      priority_weight = 2,
      comparators = {
        M.cmp.config.compare.offset,
        M.cmp.config.compare.exact,
        -- M.cmp.config.compare.scopes,
        M.cmp.config.compare.score,
        M.cmp.config.compare.recently_used,
        M.cmp.config.compare.locality,
        M.cmp.config.compare.kind,
        -- M.cmp.config.compare.sort_text,
        M.cmp.config.compare.length,
        M.cmp.config.compare.order,
        -- aid_nvim_cmp.under_compare,
        -- aid_nvim_cmp.source_compare,
        -- aid_nvim_cmp.kind_compare,
      },
    },
    -- 定义补全菜单选项的显示样式，包括图标、缩写和类型等字段的显示方式
    formatting = {
      -- sort menu
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local abbr = vim_item.abbr
        local kind = vim_item.kind
        local source = entry.source.name

        -- vim_item.kind = ("%s %s"):format(icons[kind], kind)
        -- vim_item.menu = ("<%s>"):format(source:upper())

        -- icon_prefix
        vim_item.kind = (" %s "):format(icons[kind])
        vim_item.menu = ("<%s>"):format(kind)

        vim_item.dup = M.duplicate_keywords[source] or 0

        -- determine if it is a fixed window size
        if M.complete_window_settings.fixed and vim.fn.mode() == "i" then
          local min_width = M.complete_window_settings.min_width
          local max_width = M.complete_window_settings.max_width
          local truncated_abbr = vim.fn.strcharpart(abbr, 0, max_width)

          if truncated_abbr ~= abbr then
            vim_item.abbr = ("%s %s"):format(truncated_abbr, "…")
          elseif abbr:len() < min_width then
            local padding = (" "):rep(min_width - abbr:len())
            vim_item.abbr = ("%s %s"):format(abbr, padding)
          end
        end

        return vim_item
      end,
    },
    -- 配置补全菜单窗口的样式
    window = {
      completion = M.cmp.config.window.bordered({
        winhighlight =
        "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        -- menu position offset
        col_offset = -4,
        -- content offset
        side_padding = 0,
      }),
      documentation = M.cmp.config.window.bordered({
        winhighlight =
        "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      }),
    },
  })
end

function M.after()
  -- 命令模式补全
  M.cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  })

  M.cmp.setup.cmdline("?", {
    sources = {
      { name = "buffer" },
    },
  })

  M.cmp.setup.cmdline(":", {
    sources = M.cmp.config.sources({
      { name = "path" },
      { name = "cmdline" },
    }),
  })
end

function M.confirm()
  return M.cmp.mapping(M.cmp.mapping.confirm(), { "i", "s", "c" })
end

function M.confirm_select()
  return M.cmp.mapping(M.cmp.mapping.confirm({ select = true }), { "i", "s", "c" })
end

function M.select_prev_item()
  return M.cmp.mapping(M.cmp.mapping.select_prev_item(), { "i", "s", "c" })
end

function M.select_next_item()
  return M.cmp.mapping(M.cmp.mapping.select_next_item(), { "i", "s", "c" })
end

function M.scroll_docs(n)
  return M.cmp.mapping(M.cmp.mapping.scroll_docs(n), { "i", "s", "c" })
end

function M.select_prev_n_item(n)
  return M.cmp.mapping(function(fallback)
    if M.cmp.visible() then
      ---@diagnostic disable-next-line: unused-local
      for i = 1, n, 1 do
        M.cmp.select_prev_item({ behavior = M.cmp.SelectBehavior.Select })
      end
    else
      fallback()
    end
  end, { "i", "s", "c" })
end

function M.select_next_n_item(n)
  return M.cmp.mapping(function(fallback)
    if M.cmp.visible() then
      ---@diagnostic disable-next-line: unused-local
      for i = 1, n, 1 do
        M.cmp.select_next_item({ behavior = M.cmp.SelectBehavior.Select })
      end
    else
      fallback()
    end
  end, { "i", "s", "c" })
end

function M.toggle_complete_menu()
  return M.cmp.mapping(function()
    if M.cmp.visible() then
      M.cmp.abort()
    else
      M.cmp.complete()
    end
  end, { "i", "s", "c" })
end

return M
