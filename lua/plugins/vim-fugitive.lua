-- git fugitive
-- https://github.com/tpope/vim-fugitive
return {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    keys = {
        { '<leader>c', ':Git commit<cr>', desc = 'Git commit', silent = true },
        { '<leader>P', ':Git push<cr>',   desc = 'Git push',   silent = true },
        { '<leader>P', ':!git push &<cr>',        desc = 'Git push',           silent = true },
    },
}
