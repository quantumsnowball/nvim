-- quickly delete multiple buffers based on the conditions provided
-- https://github.com/kazhala/close-buffers.nvim
return {
    'kazhala/close-buffers.nvim',
    event = 'VeryLazy',
    init = function()
        local map = require('utils').map
        local delete = require('close_buffers').delete
        -- close all and other buffer by close-buffers.nvim
        local close_current_buffer = function()
            delete({ type = 'this' })
        end
        local close_all_buffers = function()
            vim.cmd('Alpha')
            vim.cmd('tabonly')
            delete({ type = 'other' })
        end
        local close_hidden_buffers = function()
            delete({ type = 'hidden' })
        end
        local close_other_tabpages = function()
            vim.cmd('tabonly')
            delete({ type = 'hidden' })
        end
        -- keymaps
        -- map('n', '<M-w>', close_current_buffer, { desc = 'close current buffer' })
        -- map('n', '<space>x', close_current_buffer, { desc = 'close current buffer' })
        map('n', 'qb', close_current_buffer, { desc = 'close current buffer' })
        map('n', 'qa', close_all_buffers, { desc = 'close_all_buffers()' })
        map('n', 'qh', close_hidden_buffers, { desc = 'close_all_hidden_buffers()' })
        map('n', 'qo', close_other_tabpages, { desc = 'close_other_tabpages()' })
    end
}
