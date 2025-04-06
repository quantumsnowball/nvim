local map = require('utils').map
-------------
-- general --
-------------
-- lazy.nvim plugin manager quick launch
map('n', '<leader>L', '<cmd>Lazy<cr>')
-- quick save buffer
map('n', '<c-s>', '<cmd>noautocmd w<cr>')
map('i', '<c-s>', '<c-o>:w<cr>')
map('v', '<c-s>', '<esc>:w<cr>')
map('n', 'qs', '<cmd>w<cr>', { desc = 'quick save' })
map('n', ';;', '<cmd>w<cr>', { desc = 'quick save' })
map('n', ';s', '<cmd>wa<cr>', { desc = 'quick save all buffers' })
map('n', '<leader><leader>', '<cmd>wa<cr>', { desc = 'quick save all buffers' })
-- show which-key root
map('n', '<F1>', '<cmd>WhichKey<cr>', { silent = true })
-- cancel search highlight after search
map('n', '<esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search result highlight' })
-- G and gg also center line
map('n', 'G', 'Gzz')
map('n', 'gg', 'ggzz')
-- <leader>Q records macro, q is free
map({ 'n', 'v' }, '<leader>q', 'q')
map({ 'n', 'v' }, 'q', '<Nop>')
-- toggle word wrap
map('n', 'gw', '<cmd>set wrap!<cr>', { desc = 'toggle text wrap' })
-- quick fix list --
map('n', '<leader>qf', '<cmd>copen<cr>', { desc = 'open quickfix list' })
-- close tabpages to the right
map('n', 'q>', '<cmd>.+1,$tabdo :tabclose<cr>', { desc = 'close tabs to the right' })
map('n', 't>', '<cmd>.+1,$tabdo :tabclose<cr>', { desc = 'close tabs to the right' })
-- exit terminal insert mode easily
map('t', '<c-h>', '<c-\\><c-n><c-w>h')
map('t', '<c-j>', '<c-\\><c-n><c-w>j')
map('t', '<c-k>', '<c-\\><c-n><c-w>k')
map('t', '<c-l>', '<c-\\><c-n><c-w>l')
-- manually setfiletype
map('n', '<leader>.', function() vim.fn.feedkeys(':setfiletype ') end, { desc = 'Set file type manually' })
