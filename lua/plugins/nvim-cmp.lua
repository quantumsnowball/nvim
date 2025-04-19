-- auto completion engine
-- https://github.com/hrsh7th/nvim-cmp
return {
    'hrsh7th/nvim-cmp',
    version = false, -- last release is way too old
    event = 'VeryLazy',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        {
            'L3MON4D3/LuaSnip',
            dependencies = {
                'saadparwaiz1/cmp_luasnip',
                'rafamadriz/friendly-snippets',
            },
            init = function() require('luasnip.loaders.from_vscode').lazy_load() end,
        },
        'onsails/lspkind.nvim',
    },
    opts = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')

        -- setup opts
        return {
            snippet = {
                expand = function(args) require('luasnip').lsp_expand(args.body) end,
            },
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping.confirm(),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<cr>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
                { name = 'luasnip' },
                { name = 'lazydev', group_index = 0 },
            }),
            formatting = {
                -- ref:
                -- https://github.com/onsails/lspkind.nvim
                format = lspkind.cmp_format(),
            },
            view = {
                entries = { name = 'custom', selection_order = 'near_cursor' },
            },
        }
    end,
}
