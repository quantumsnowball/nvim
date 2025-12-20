-- treesitter modules from the old master branch
-- https://github.com/MeanderingProgrammer/treesitter-modules.nvim
return {
    'MeanderingProgrammer/treesitter-modules.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ---@module 'treesitter-modules'
    ---@type ts.mod.UserConfig
    opts = {
        incremental_selection = {
            enable = true,
            disable = false,
            -- set value to `false` to disable individual mapping
            keymaps = {
                init_selection = '<leader>is',
                node_incremental = '<Tab>',
                scope_incremental = false,
                node_decremental = '<BS>',
            },
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
                if t:find('^identifier') or t:find('^word') then
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
