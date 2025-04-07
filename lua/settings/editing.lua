local map = require('utils').map

-- manual reload the file if modified externally
map('n', '<F5>', '<cmd>checktime<cr>')
-- t is free
map('n', 't', '<Nop>')
map('n', 'T', '<Nop>')
-- switch case
map('n', 'U', '~')
-- quick set shiftwidth
map('n', '<space>2', '<cmd>set shiftwidth=2<cr>')
map('n', '<space>4', '<cmd>set shiftwidth=4<cr>')
-- commenting code
map('n', '<leader>/', 'gcc', { remap = true, desc = 'toggle line comment' })
map('v', '<leader>/', 'gc', { remap = true, desc = 'toggle selection comment' })
-- home and end in normal, visual, operator mode
map({ 'n', 'v', 'o' }, 'gh', '^', { desc = 'Home' })
map({ 'n', 'v', 'o' }, 'gl', '$', { desc = 'End' })
map({ 'n', 'v', 'o' }, 'L', 'E')
map({ 'n', 'v', 'o' }, 'H', 'B')
-- center cursor line
map({ 'n', 'v' }, 'M', 'zz')
-- home and end in insert mode
map('i', '<C-h>', '<home>')
map('i', '<C-l>', '<end>')
-- shift-tab will go one tab backward
map('i', '<S-Tab>', '<C-d>')
-- \ break line, | reverse break line
map('n', '|', 'i<C-m><esc>:MoveLine(-1)<cr>')
map('n', '\\', 'i<C-m><esc>')
-- go and gO will open new line but stay in normal mode
map('n', 'gO', 'O<esc>', { desc = 'open a new line above' })
map('n', 'go', 'o<esc>', { desc = 'open a new line below' })
-- g, and g. insert space before/after cursor
map('n', 'g,', 'i<space><esc><right>', { desc = 'insert a space right' })
map('n', 'g.', 'a<space><esc><left>', { desc = 'insert a space left' })
-- g), g], g} insert closing pair match at line end in normal mode
map('n', 'z)', '$a)<esc>', { desc = 'insert `)` at line end' })
map('n', 'z0', '$a)<esc>', { desc = 'insert `)` at line end' }) -- shorthand for )
map('n', 'z]', '$a]<esc>', { desc = 'insert `]` at line end' })
map('n', 'z}', '$a}<esc>', { desc = 'insert `}` at line end' })
map('n', "z'", "$a'<esc>", { desc = "insert `'` at line end" })
map('n', 'z"', '$a"<esc>', { desc = 'insert `"` at line end' })
-- g; insert : at the end of line
map('n', 'g;', 'A:<esc>', { desc = 'insert `;` at line end' })
-- C-o will also open new line in insert mode
map('i', '<C-o>', '<esc>o')
-- toggle spell checking
map('n', '<leader>sc', '<cmd>set spell!<cr>', { desc = 'toggle spell checking' })
-- use Tab to toggle matching group
-- -- normal mode: matching  or tags (by matchit.vim, need to set remap=true)
-- -- visual mode: easily select the opposite matching whole section
-- -- operation pending mode: can delete, yank, or cut the whole section, very handy!
map({ 'n', 'v', 'o' }, '<Tab>', '%', { remap = true })
map({ 'n', 'v', 'o' }, '[<Tab>', '[m', { remap = true })
map({ 'n', 'v', 'o' }, ']<Tab>', ']m', { remap = true })
-- search for pairable symbols
vim.cmd "noremap zl <Cmd>call search('[([{<>}\\])]')<cr>"
vim.cmd "noremap zh <Cmd>call search('[([{<>}\\])]', 'b')<cr>"
-- select inner word/line(without linebreak)
map('n', ';w', 'hevb', { desc = 'select word, curosr to beginning' })
map('n', ';e', 'viw', { desc = 'select word, cursor to end' })
map('n', ';a', '$v^', { desc = 'select whole line' })
-- edit/delete inner word
map('n', ';d', '"_diw', { desc = 'delete inner word' })
map('n', ';D', '"_diW', { desc = 'delete inner word' })
map('n', ';c', '"_ciw', { desc = 'change inner word' })
map('n', ';C', '"_ciW', { desc = 'change inner word' })
-- delete line
map('n', ';l', '"_dd', { desc = 'delete whole line' })
-- quick pairs
--   new line
map('n', 'g[', 'A<space>[<cr>]<esc>O', { desc = 'insert `[]` pair on new line' })
map('n', 'g{', 'A<space>{<cr>}<esc>O', { desc = 'insert `{}` pair on new line' })
map('n', 'g(', 'A<space>(<cr>)<esc>O', { desc = 'insert `()` pair on new line' })
--   same line
map('n', 'g]', 'a[]<left>', { desc = 'insert `[]` pair on same line' })
map('n', 'g}', 'a{}<left>', { desc = 'insert `{}` pair on same line' })
map('n', 'g)', 'a()<left>', { desc = 'insert `()` pair on same line' })
map('n', "g'", "a''<left>", { desc = "insert `''` pair on same line" })
map('n', 'g"', 'a""<left>', { desc = 'insert `""` pair on same line' })
-- </> tags
map('n', 'g<', 'A<><left>', { desc = 'insert `<>` pair on same line' })
map('n', 'g>', 'A</><left>', { desc = 'insert `</>` pair on same line' })
-- Inspect lexical / syntax / semantics
map('n', ';i', '<cmd>Inspect<cr>', { desc = 'Inspect semantics under cursor' })
map('n', ';I', '<cmd>InspectTree<cr>', { desc = 'InspectTree' })
