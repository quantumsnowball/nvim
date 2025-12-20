-- smart incremental selection
-- https://github.com/SUSTech-data/wildfire.nvim
return {
    'sustech-data/wildfire.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {
        keymaps = {
            init_selection = '<leader>is',
            node_incremental = '<Tab>',
            node_decremental = '<BS>',
        },
    },
    init = function()
        local map = require('utils').map

        -- smart incremental selection
        map('n', '<Tab>', function()
            -- get node
            local node = vim.treesitter.get_node()
            if node then
                -- get node_type
                local t = node:type()
                -- special case where I want to select inner word first
                if
                    t:find('^string')
                    or t:find('^class')
                    or t:find('^function')
                    or t:find('^function')
                    or t:find('^if')
                    or t:find('^elif')
                    or t:find('^for')
                    or t:find('^while')
                    or t:find('^with')
                    or t:find('^try')
                    or t:find('^except')
                then
                    vim.fn.feedkeys('viw,is')
                    return
                end
            end
            -- default is init selection
            vim.fn.feedkeys(',is')
        end, { desc = 'smart incremental selection' })
    end,
}
