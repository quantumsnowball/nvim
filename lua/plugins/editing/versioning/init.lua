local use = require('packer').use


-- show git changes
-- https://github.com/lewis6991/gitsigns.nvim
use {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup()
        -- show line number
        vim.opt.number = true
        -- always include sign column to fix gutter width
        vim.opt.signcolumn = 'yes'
        -- highlight current line and column
        vim.opt.cursorline = true
    end
}
-- lazygit version control
--
use {
    'kdheepak/lazygit.nvim',
    config = function()
        -- toggle keymap
        vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>')
    end
}
-- git fugitive
use 'tpope/vim-fugitive'
