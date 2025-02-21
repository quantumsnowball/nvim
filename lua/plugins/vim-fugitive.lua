-- git fugitive
-- https://github.com/tpope/vim-fugitive
return {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    keys = {
        { '<leader>c', ':Git commit<cr>', desc = 'Git commit' },
    },
}
