--
-- some common related shortcuts
--
local map = require('utils').map

-- navigate between buffers
map('n', 'q-', ':bprev<CR>', { desc = 'previous buffer' })
map('n', 'q=', ':bnext<CR>', { desc = 'next buffer' })
map('n', 'q;', ':e #<CR>', { desc = 'edit previous buffer' })

-- navigate between tabpages
map('n', 'tj', ':tabprevious<cr>')
map('n', 'tk', ':tabnext<cr>')
map('n', 'th', ':-tabmove<cr>')
map('n', 'tl', ':+tabmove<cr>')
map('n', 'tn', function()
    vim.cmd('tabnew')
    vim.cmd('Alpha')
    require('close_buffers').delete({ type = 'nameless' })
end, { desc = 'tabnew_alpha_after' })
map('n', 'tN', function()
    vim.cmd('-1tabnew')
    vim.cmd('Alpha')
    require('close_buffers').delete({ type = 'nameless' })
end, { desc = 'tabnew_alpha_before' })
map('n', 'to', ':tab split<cr>', { desc = 'duplicate window to new tabpage' })
map('n', 'tm', '<C-W>T', { desc = 'move window to new tabpage' })
map('n', '<F12>', '<C-W>T', { desc = 'move window to new tabpage' })

-- closing tabs
local close_onto_previous_tab = function()
    local idx = vim.fn.tabpagenr()
    local cnt = vim.fn.tabpagenr('$')
    vim.cmd('tabclose')
    if ((idx ~= 1) and (idx < cnt)) then
        vim.cmd('tabprevious')
    end
end
map('n', 'qt', close_onto_previous_tab, { desc = 'close_onto_previous_tab()' })
map('n', 'tq', close_onto_previous_tab, { desc = 'close_onto_previous_tab()' })
map('n', 'tc', ':tabclose<cr>')
map('n', 't;', 'g<Tab>')
map('n', 'tH', ':tabfirst<cr>')
map('n', 'tL', ':tablast<cr>')

-- quickly go to a tabpage with number 1 to 9
for i = 1, 9, 1 do
    map('n', 't' .. i, i .. 'gt')
    map('n', '<leader>' .. i, i .. 'gt')
end
map('n', 't0', '10gt')
map('n', '<leader>0', '10gt')

-- default split to right and below
vim.opt.splitbelow = true
vim.opt.splitright = true
