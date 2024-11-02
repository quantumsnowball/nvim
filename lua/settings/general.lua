local map = require('utils').map
-------------
-- general --
-------------
-- lazy.nvim plugin manager quick launch
map('n', '<leader>L', ':Lazy<cr>')
-- quick save buffer
map('n', '<c-s>', ':noautocmd w<cr>')
map('i', '<c-s>', '<c-o>:w<cr>')
map('v', '<c-s>', '<esc>:w<cr>')
map('n', 'qs', ':w<cr>', { desc = 'quick save' })
map('n', ';s', ':w<cr>', { desc = 'quick save' })
map('n', ';S', ':wa<cr>', { desc = 'quick save all buffers' })
map('n', '<leader><leader>', ':wa<cr>', { desc = 'quick save all buffers' })
-- show which-key root
map('n', '<F1>', ':WhichKey<cr>', { silent = true })
-- cancel search highlight after search
map('n', 'zi', ':noh<cr>', { desc = 'Clear search result highlight' })
map('n', 'z/', ':noh<cr>', { desc = 'Clear search result highlight' })
-- G and gg also center line
map('n', 'G', 'Gzz')
map('n', 'gg', 'ggzz')
-- <leader>Q records macro, q is free
map({ 'n', 'v' }, '<leader>q', 'q')
map({ 'n', 'v' }, 'q', '<Nop>')
-- toggle word wrap
map('n', 'gw', ':set wrap!<cr>')
-- quick fix list --
map('n', '<leader>qf', ':copen<cr>', { desc = 'open quickfix list' })
-- close tabpages to the right
map('n', 'q>', '<cmd>.+1,$tabdo :tabclose<cr>', { desc = 'close tabs to the right' })
map('n', 't>', '<cmd>.+1,$tabdo :tabclose<cr>', { desc = 'close tabs to the right' })
-- exit terminal insert mode easily
map('t', '<c-h>', '<c-\\><c-n><c-w>h')
map('t', '<c-j>', '<c-\\><c-n><c-w>j')
map('t', '<c-k>', '<c-\\><c-n><c-w>k')
map('t', '<c-l>', '<c-\\><c-n><c-w>l')
