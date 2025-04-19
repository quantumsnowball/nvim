-- editable buffer file explorer
-- https://github.com/stevearc/oil.nvim
return {
    'stevearc/oil.nvim',
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
        { '<leader>EE', '<cmd>Oil --float<cr>', { desc = 'Oil float' } },
    },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        float = {
            max_width = 0.5,
            max_height = 0.8,
        },
        -- ref:
        -- https://github.com/stevearc/oil.nvim/blob/master/lua/oil/config.lua
        -- See :help oil-actions for a list of all available actions
        use_default_keymaps = false,
        keymaps = {
            -- navigate
            ['<cr>'] = { 'actions.select', mode = 'n' },
            ['<space>'] = { 'actions.select', mode = 'n' },
            ['<bs>'] = { 'actions.parent', mode = 'n' },
            -- ['<esc>'] = { 'actions.close', mode = 'n' },
            ['<esc>'] = { '<cmd>wq<cr>', mode = 'n' },
            ['\\'] = { 'actions.select', opts = { vertical = true } },
            ['-'] = { 'actions.select', opts = { horizontal = true } },
            -- view
            ['gp'] = 'actions.preview',
            ['gs'] = { 'actions.change_sort', mode = 'n' },
            ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
            -- save (confirm change)
            ['<C-s>'] = '<cmd>w<cr>',
            -- help
            ['g?'] = { 'actions.show_help', mode = 'n' },
        },
    },
}
