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
map('n', 'qs', ':w<cr>')
map('n', ';s', ':w<cr>')
-- quit windo shortcut
map('n', 'qw', ':q<cr>')
map('n', 'qW', ':qa<cr>')
map('n', 'qv', ':qa<cr>')
-- show which-key root
map('n', '<F1>', ':WhichKey<cr>', { silent = true })
-- toggle split windows
map('n', 'g-', ':split<cr>')
map('n', 'g\\', ':vsplit<cr>')
-- toggle a new tabpage
map('n', '<F12>', ':tabnew<cr>')
-- cancel search highlight after search
map('n', 'zi', ':noh<cr>', {}, 'Clear search result highlight')
-- G also center line
map('n', 'G', 'Gzz')
-- <leader>Q records macro, q is free
map({ 'n', 'v' }, '<leader>q', 'q')
map({ 'n', 'v' }, 'q', '<Nop>')
-- toggle word wrap
map('n', 'gw', ':set wrap!<cr>')
-- quick fix list --
map('n', 'qfo', ':copen<cr>')
map('n', 'qfc', ':cclose<cr>')
map('n', 'qfj', ':cnext<cr>')
map('n', 'qfk', ':cprev<cr>')
