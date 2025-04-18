-- create color scheme with ease
-- https://github.com/tjdevries/colorbuddy.nvim
return {
    'tjdevries/colorbuddy.nvim',
    enabled = false,
    init = function()
        vim.cmd('hi clear')
        if vim.fn.exists('syntax_on') then vim.cmd('syntax reset') end
        vim.o.background = 'dark'
        vim.o.termguicolors = true

        -- select a default colorscheme
        vim.cmd('colorscheme FourSeasons-Winter')
    end,
}
