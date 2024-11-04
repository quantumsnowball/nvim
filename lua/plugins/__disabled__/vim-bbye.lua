-- better buffer delete command
-- https://github.com/moll/vim-bbye
return {
    'moll/vim-bbye',
    event = 'VeryLazy',
    init = function()
        local map = require('utils').map
        -- close last buffer doesn't play well with nvimtree, using vim-bbye now
        map('n', '<M-w>', ':Bdelete<CR>')
        map('n', '<space>x', ':Bdelete<CR>')
        map('n', 'qb', ':Bdelete<CR>', { desc = 'close buffer' })
    end
}
