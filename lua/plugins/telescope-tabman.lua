-- tabman
-- https://github.com/quantumsnowball/telescope-tabman.nvim
return {
    'quantumsnowball/telescope-tabman.nvim',
    event = 'VeryLazy',
    branch = 'dev',
    dependencies = 'nvim-telescope/telescope.nvim',
    init = function()
        local tele = require('telescope')
        local tabman = tele.extensions.tabman.tabman
        -- load extension
        tele.load_extension('tabman')
        -- configs
        local layout_config = { width = 0.7, preview_height = 0.5, }
        -- keymaps
        require('utils').map('n', '<leader>t', function()
            tabman({ layout_config = layout_config })
        end, { desc = 'telescope.tabpages()' })
        require('utils').map('n', 'tt', function()
            tabman({ layout_config = layout_config })
        end, { desc = 'telescope.tabpages()' })
        require('utils').map('n', '<space>t', function()
            tabman({ layout_config = layout_config })
        end, { desc = 'telescope.tabpages()' })
    end
}
