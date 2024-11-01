local map = require('utils').map

-- manual reload the file if modified externally
map('n', '<F5>', ':checktime<CR>')
-- t is free
map('n', 't', '<Nop>')
map('n', 'T', '<Nop>')
-- switch case
map('n', 'U', '~')
-- quick set shiftwidth
map('n', '<space>2', ':set shiftwidth=2<cr>')
map('n', '<space>4', ':set shiftwidth=4<cr>')
-- begin and end of Word in visual mode
-- map('v', 'gk', 'E')
-- map('v', 'gj', 'B')
-- home and end in normal, visual, operator mode
map({ 'n', 'v', 'o' }, 'gh', '^', { desc = 'Home' })
map({ 'n', 'v', 'o' }, 'gl', '$', { desc = 'End' })
-- home and end in insert mode
map('i', '<C-h>', '<home>')
map('i', '<C-l>', '<end>')
-- shift-tab will go one tab backward
map('i', '<S-Tab>', '<C-d>')
-- \ break line, | reverse break line
map('n', '|', 'i<C-m><esc>:MoveLine(-1)<CR>')
map('n', '\\', 'i<C-m><esc>')
-- go and gO will open new line but stay in normal mode
map('n', 'gO', 'O<esc>')
map('n', 'go', 'o<esc>')
-- g, and g. insert space before/after cursor
map('n', 'g,', 'i<space><esc><right>')
map('n', 'g.', 'a<space><esc><left>')
-- g), g], g} insert closing pair match at line end in normal mode
map('n', 'g)', '$a)<esc>')
map('n', 'g0', '$a)<esc>') -- shorthand for )
map('n', 'g]', '$a]<esc>')
map('n', 'g}', '$a}<esc>')
map('n', "g'", "$a'<esc>")
map('n', 'g"', '$a"<esc>')
-- g; insert : at the end of line
map('n', 'g;', 'A:<esc>')
-- C-o will also open new line in insert mode
map('i', '<C-o>', '<esc>o')
-- toggle spell checking
map('n', '<leader>sc', ':set spell!<cr>')
-- use Tab to toggle matching group
-- -- normal mode: matching  or tags (by matchit.vim, need to set remap=true)
-- -- visual mode: easily select the opposite matching whole section
-- -- operation pending mode: can delete, yank, or cut the whole section, very handy!
map({ 'n', 'v', 'o' }, '<Tab>', '%', { remap = true })
map({ 'n', 'v', 'o' }, '[<Tab>', '[m', { remap = true })
map({ 'n', 'v', 'o' }, ']<Tab>', ']m', { remap = true })
-- search for pairable symbols
vim.cmd "noremap zl <Cmd>call search('[([{<>}\\])]')<CR>"
vim.cmd "noremap zh <Cmd>call search('[([{<>}\\])]', 'b')<CR>"
-- select inner word/line(without linebreak)
map('n', ';w', 'hevb')
map('n', ';e', 'viw')
map('n', ';a', '$v^')
-- edit/delete inner word
map('n', ';d', '"_diw')
map('n', ';D', '"_diW')
map('n', ';c', '"_ciw')
map('n', ';C', '"_ciW')
-- delete line
map('n', ';l', '"_dd')
-- quick pairs
--   new line
map('n', '<leader>[', 'A<space>[<cr>]<esc>O')
map('n', '<leader>{', 'A<space>{<cr>}<esc>O')
map('n', '<leader>(', 'A<space>(<cr>)<esc>O')
--   same line
map('n', '<leader>]', 'a[]<left>')
map('n', '<leader>}', 'a{}<left>')
map('n', '<leader>)', 'a()<left>')
map('n', "<leader>'", "a''<left>")
map('n', '<leader>"', 'a""<left>')
-- </> tags
map('n', '<leader><', 'A<><left>')
map('n', '<leader>>', 'A</><left>')
