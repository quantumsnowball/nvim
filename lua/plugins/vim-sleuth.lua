-- smart detect document indentation
-- https://github.com/tpope/vim-sleuth
return {
    'tpope/vim-sleuth',
    event = 'VimEnter',
    init = function()
        -- default neovim tabsize to 4 space
        vim.opt.tabstop = 4
        -- shift width match with tabstop
        vim.opt.shiftwidth = 4
        -- use space instead of tab char
        vim.opt.expandtab = true
    end
}
