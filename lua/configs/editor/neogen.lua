-- https://github.com/danymat/neogen

local api = require("utils.api")
-- local i = require("neogen.types.template").item
local M = {
    requires = {
        "neogen",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    local item = require("neogen.types.template").item
    M.neogen.setup({
        enabled = true,
        input_after_comment = true,
        languages = {
            typescript = {
                template = {
                    annotation_convention = "tsdoc",
                    tsdoc = {
                        { nil, "/* $1 */", { no_results = true, type = { "func", "class" } } },
                        { nil, "/* @type $1 */", { no_results = true, type = { "type" } } },

                        { nil, "/**", { no_results = true, type = { "file" } } },
                        { nil, " * @module $1", { no_results = true, type = { "file" } } },
                        { nil, " */", { no_results = true, type = { "file" } } },

                        { nil, "/**", { type = { "class", "func" } } },
                        -- { i.ClassName, " * $1", { type = { "class" } } },
                        { nil, " * $1", { type = { "func" } } },
                        { item.Type, " * @template %s - $1", { type = { "func" } } },
                        { item.Parameter, " * @param %s - $1", { type = { "func" } } },
                        {
                            { item.Parameter },
                            " * @param %s - $1",
                            { required = item.Tparam, type = { "func" } },
                        },
                        { item.Return, " * @returns $1", { type = { "func" } } },
                        { nil, " */", { type = { "class", "func" } } },
                    },
                },
            },
            javascript = {
                template = {
                    annotation_convention = "jsdoc",
                    jsdoc = {
                        { nil, "/* $1 */", { no_results = true, type = { "func", "class" } } },
                        { nil, "/* @type $1 */", { no_results = true, type = { "type" } } },

                        { nil, "/**", { no_results = true, type = { "file" } } },
                        { nil, " * @module $1", { no_results = true, type = { "file" } } },
                        { nil, " */", { no_results = true, type = { "file" } } },

                        { nil, "/**", { type = { "class", "func" } } },
                        {
                            item.ClassName,
                            " * @classdesc $1",
                            { before_first_item = { " * ", " * @class" }, type = { "class" } },
                        },
                        { item.Parameter, " * @param {any} %s $1", { type = { "func" } } },
                        {
                            { item.Type, item.Parameter },
                            " * @param {%s} %s $1",
                            { required = item.Tparam, type = { "func" } },
                        },
                        { item.Return, " * @returns {$1} $1", { type = { "func" } } },
                        { nil, " */", { type = { "class", "func" } } },
                    },
                },
            },
        },
    })
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>nf",
            rhs = "<cmd>lua require('neogen').generate({type='func'})<cr>",
            options = { silent = true },
            description = "Generate function annotation",
        },
    })
end

return M
