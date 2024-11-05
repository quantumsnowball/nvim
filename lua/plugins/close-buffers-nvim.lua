-- quickly delete multiple buffers based on the conditions provided
-- https://github.com/kazhala/close-buffers.nvim
return {
    'kazhala/close-buffers.nvim',
    event = 'VeryLazy',
    opts = {
        -- Types of deletion that should preserve the window layout
        preserve_window_layout = { 'this', 'nameless', 'other' },
    },
    init = function()
        local map = require('utils').map
        local delete = require('close_buffers').delete

        -- keymaps
        map('n', 'qb',
            function()
                delete({ type = 'this' })
            end,
            { desc = 'close current buffer' })
        map('n', 'qo',
            function()
                vim.cmd('tabonly')
                delete({ type = 'other' })
            end,
            { desc = 'close other buffers and tabpages' })
        map('n', 'qOb',
            function()
                delete({ type = 'other' })
            end,
            { desc = 'close other buffers' })
        map('n', 'qOt',
            function()
                vim.cmd('tabonly')
            end,
            { desc = 'close other tabpages' })
        map('n', 'qa',
            function()
                vim.cmd('tabnew | Alpha')
                vim.cmd('tabonly')
                delete({ type = 'hidden' })
            end,
            { desc = 'close all buffers and tabpages' })
        map('n', 'qA',
            function()
                vim.cmd('tabnew | Alpha')
                vim.cmd('tabonly')
                delete({ type = 'hidden', force = true })
            end,
            { desc = 'close all buffers and tabpages (force)' })
        map('n', 'qh',
            function()
                delete({ type = 'hidden', force = true })
            end,
            { desc = 'close all hidden buffers' })
    end
}
