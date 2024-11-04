-- quickly delete multiple buffers based on the conditions provided
return {
    -- https://github.com/kazhala/close-buffers.nvim
    'kazhala/close-buffers.nvim',
    event = 'VeryLazy',
    init = function()
        local map = require('utils').map
        local delete = require('close_buffers').delete
        -- close all and other buffer by close-buffers.nvim
        local close_current_buffer = function()
            delete({ type = 'this' })
        end
        local close_other_buffer = function()
            delete({ type = 'other' })
        end
        local close_other_buffers_and_tabpages = function()
            vim.cmd('tabonly')
            delete({ type = 'other' })
        end
        local close_other_tabpages = function()
            vim.cmd('tabonly')
        end
        local close_all_buffers_and_tabpages = function()
            vim.cmd('Alpha')
            vim.cmd('tabonly')
            delete({ type = 'other' })
        end
        local close_hidden_buffers = function()
            delete({ type = 'hidden' })
        end
        -- keymaps
        map('n', 'qb', close_current_buffer, { desc = 'close current buffer' })
        map('n', 'qo', close_other_buffers_and_tabpages, { desc = 'close other buffers and tabpages' })
        map('n', 'qOb', close_other_buffer, { desc = 'close other buffers' })
        map('n', 'qOt', close_other_tabpages, { desc = 'close other tabpages' })
        map('n', 'qa', close_all_buffers_and_tabpages, { desc = 'close all buffers and tabpages' })
        map('n', 'qh', close_hidden_buffers, { desc = 'close all hidden buffers' })
    end
}
