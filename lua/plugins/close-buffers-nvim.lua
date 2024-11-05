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

        --
        -- keymaps
        --
        -- current
        local function qb(force)
            return function()
                delete({ type = 'this', force = force })
            end
        end
        map('n', 'qb', qb(false), { desc = 'close current buffer' })
        map('n', 'qB', qb(true), { desc = 'close current buffer (force)' })
        -- all
        local function qa(force)
            return function()
                vim.cmd('tabnew | Alpha')
                vim.cmd('tabonly')
                delete({ type = 'hidden', force = force })
            end
        end
        map('n', 'qa', qa(false), { desc = 'close all buffers and tabpages' })
        map('n', 'qA', qa(true), { desc = 'close all buffers and tabpages (force)' })
        -- others
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
    end
}
