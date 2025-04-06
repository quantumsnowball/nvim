-- better buffer delete command
-- https://github.com/moll/vim-bbye
return {
    'moll/vim-bbye',
    event = 'VeryLazy',
    init = function()
        local map = require('utils').map
        -- close last buffer doesn't play well with nvimtree, using vim-bbye now
        map('n', '<M-w>', ':Bdelete<cr>')
        map('n', '<space>x', ':Bdelete<cr>')
        map('n', 'qb', ':Bdelete<cr>', { desc = 'close buffer' })
    end
}
