-- init
vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then vim.cmd('syntax reset') end
vim.o.background = 'dark'
vim.o.termguicolors = true

-- default theme
vim.cmd('colorscheme FourSeasons-Winter')
