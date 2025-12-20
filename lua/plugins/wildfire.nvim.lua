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
                -- special cases
                -- where it is suitable to directly to init selection
                if t:find('^identifier') then
                    vim.fn.feedkeys(',is')
                    return
                end
            end
            -- default is  inner word first, then init selection
            vim.fn.feedkeys('viw,is')
        end, {
            desc = 'smart incremental selection',
        })
    end,
}
