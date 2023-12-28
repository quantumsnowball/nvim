-- enable mouse visual select mode
vim.opt.mouse = 'a'
-- vim buildin syntax highlight
vim.cmd('syntax on')
-- match parenthesizes formatting
vim.cmd('autocmd BufEnter * hi MatchParen ctermbg=Gray guibg=Gray')
-- always open help in a new tab
vim.cmd("autocmd BufEnter *.txt if &filetype == 'vimdoc' | silent wincmd T | endif")
-- add margins when scrolling with curosr
vim.opt.scrolloff = 5
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
-- tabline highlight
vim.cmd('autocmd VimEnter,ColorScheme * hi BufferLineTab guifg=White guibg=#226622')
vim.cmd('autocmd VimEnter,ColorScheme * hi BufferLineTabSelected guifg=Black guibg=#22ff44')
vim.cmd('autocmd VimEnter,ColorScheme * hi BufferLineTabClose guifg=White')
-- list help buffer
vim.cmd('autocmd FileType help set buflisted')
