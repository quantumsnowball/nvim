--
-- some common related shortcuts
--
local map = require('utils').map

-- navigate between buffers
map('n', 'q-', '<cmd>bprev<cr>', { desc = 'previous buffer' })
map('n', 'q=', '<cmd>bnext<cr>', { desc = 'next buffer' })
map('n', 'q;', '<cmd>e #<cr>', { desc = 'edit previous buffer' })

-- navigate between tabpages
map('n', 'tj', '<cmd>tabprevious<cr>', { desc = 'previous tab' })
map('n', 'tk', '<cmd>tabnext<cr>', { desc = 'next tab' })
map('n', 'th', '<cmd>-tabmove<cr>', { desc = 'move tab left' })
map('n', 'tl', '<cmd>+tabmove<cr>', { desc = 'move tab right' })
map('n', 'tn', function()
    vim.cmd('tabnew')
    vim.cmd('Alpha')
    require('close_buffers').delete({ type = 'nameless' })
end, { desc = 'open new tab on right' })
map('n', 'tN', function()
    vim.cmd('-1tabnew')
    vim.cmd('Alpha')
    require('close_buffers').delete({ type = 'nameless' })
end, { desc = 'open new tab on left' })
map(
    'n',
    'to',
    '<cmd>tab split<cr><cmd>Neotree reveal float<cr>',
    { desc = 'open current buffer on new tab on right, then open explorer' }
)
map(
    'n',
    'tO',
    '<cmd>-1tab split<cr><cmd>Neotree reveal float<cr>',
    { desc = 'open current buffer on new tab on right, then open explorer' }
)
map('n', 'tm', '<C-W>T', { desc = 'move window to new tabpage' })
map('n', '<F12>', '<C-W>T', { desc = 'move window to new tabpage' })

-- closing tabs
local close_onto_previous_tab = function()
    local idx = vim.fn.tabpagenr()
    local cnt = vim.fn.tabpagenr('$')
    vim.cmd('tabclose')
    if (idx ~= 1) and (idx < cnt) then vim.cmd('tabprevious') end
end
map('n', 'qt', close_onto_previous_tab, { desc = 'close tab' })
map('n', 'tq', close_onto_previous_tab, { desc = 'close tab' })
map('n', 'tc', '<cmd>tabclose<cr>', { desc = 'close tab' })
map('n', 't;', 'g<Tab>', { desc = 'previous tab' })
map('n', 'tH', '<cmd>tabfirst<cr>', { desc = 'go to first tab' })
map('n', 'tL', '<cmd>tablast<cr>', { desc = 'go to last tab' })

-- quickly go to a tabpage with number 1 to 9
for i = 1, 9, 1 do
    map('n', 't' .. i, i .. 'gt', { desc = 'go to tab ' .. i })
    map('n', '<leader>' .. i, i .. 'gt', { desc = 'go to tab ' .. i })
end
map('n', 't0', '10gt', { desc = 'go to tab 10' })
map('n', '<leader>0', '10gt', { desc = 'go to tab 10' })

-- default split to right and below
vim.opt.splitbelow = true
vim.opt.splitright = true
