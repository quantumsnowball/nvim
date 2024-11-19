-- git fugitive
-- https://github.com/tpope/vim-fugitive
return {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    init = function()
        require('utils').map('n', '<leader>Gd', ':Gvdiff<cr>', { desc = 'telescope.diagnostics()' })
        require('utils').map('n', '<leader>gc', ':Git commit<cr>', {})
        require('utils').map('n', '<leader>gp', ':Git push<cr>', {})
        require('utils').map('n', '<leader>gl', ':Git pull<cr>', {})
    end
}
