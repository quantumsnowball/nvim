-- enable mouse visual select mode
vim.opt.mouse = 'a'
-- vim buildin syntax highlight
vim.cmd('syntax on')
-- match parenthesizes formatting
vim.cmd('autocmd BufEnter * hi MatchParen ctermbg=Gray guibg=Gray')
-- cursorline and cursorcolumn formatting
vim.cmd('autocmd BufEnter * hi CursorLine ctermbg=999 guibg=#555555')
vim.cmd('autocmd BufEnter * hi CursorColumn ctermbg=999 guibg=#555555')
-- always open help in a new tab
vim.cmd("autocmd BufEnter *.txt if &filetype == 'help' || &filetype == 'vimdoc' | silent wincmd T | endif")
-- add margins when scrolling with curosr
vim.opt.scrolloff = 5
-- default neovim tabsize to 4 space
vim.opt.tabstop = 4
-- shift width match with tabstop
vim.opt.shiftwidth = 4
-- use space instead of tab char
vim.opt.expandtab = true
-- set scroll=10 for normal buffer, scroll more
-- p.s. will fail for very short windows, therefore silent!
vim.cmd('autocmd BufEnter,WinScrolled * if &buftype == "" | silent! set scroll=10 | endif')
-- WipeReg
vim.cmd('command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor')
-- vim.cmd('autocmd VimEnter * WipeReg')
-- treat dash-connected word as single word
-- vim.cmd('set iskeyword+=-')
-- write and delete buffer command
vim.cmd [[cnoreabbrev wd w\|bd"]]
-- virtualedit in all modes
vim.opt.virtualedit = 'all'
-- split border color
vim.cmd('autocmd VimEnter,ColorScheme * hi VertSplit guifg=#339933')
-- default nowrap
vim.opt.wrap = false
-- spell highlight background color
vim.cmd('autocmd VimEnter,BufEnter,ColorScheme * syntax on')
vim.cmd('autocmd VimEnter,BufEnter,ColorScheme * hi SpellBad guibg=#770000')
vim.cmd('autocmd VimEnter,BufEnter,ColorScheme * hi SpellCap guibg=#770000')
vim.cmd('autocmd VimEnter,BufEnter,ColorScheme * hi SpellRare guibg=#770000')
vim.cmd('autocmd VimEnter,BufEnter,ColorScheme * hi SpellLocal guibg=#770000')
-- list help buffer
vim.cmd('autocmd FileType help set buflisted')
-- do not show cmdline when not using
vim.cmd('set cmdheight=0')
