-- auto completion engine
-- https://github.com/hrsh7th/nvim-cmp
return {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "VeryLazy",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip',
    },
    config = function()
        local cmp = require("cmp")

        -- cmdline cmp
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                {
                    name = 'cmdline',
                    option = {
                        ignore_cmds = { 'Man', '!' }
                    }
                }
            })
        })

        -- buffer cmp
        cmp.setup {
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            mapping = cmp.mapping.preset.insert(
                require('plugins.nvim-cmp.keymaps')),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
                { name = 'luasnip' },
                { name = "lazydev", group_index = 0 }
            }),
            formatting = {
                format = function(_, item)
                    local icons = require("plugins.nvim-cmp/constants").icons.kinds
                    if icons[item.kind] then
                        item.kind = icons[item.kind] .. item.kind
                    end
                    return item
                end,
            },
            view = {
                entries = { name = 'custom', selection_order = 'near_cursor' }
            },
        }
    end
}
