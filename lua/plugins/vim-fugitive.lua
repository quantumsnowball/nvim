-- git fugitive
-- https://github.com/tpope/vim-fugitive
return {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    keys = {
        { '<leader>c', ':Git commit<cr>',         desc = 'Git commit',         silent = true },
        { '<leader>a', ':Git commit --amend<cr>', desc = 'Git commit --amend', silent = true },
        { '<leader>P', ':!git push &<cr>',        desc = 'Git push',           silent = true },
    },
}
