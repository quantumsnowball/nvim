local map = require('utils').map
---------------
-- clipboard --
---------------
-- delete
map({ 'n', 'v' }, 'x', '"_x')
map({ 'n', 'v' }, 'X', '"_X')
map({ 'n', 'v' }, 'd', '"_d')
map({ 'n', 'v' }, 'D', '"_D')
-- replace
map({ 'n', 'v' }, 'c', '"_c')
map({ 'n', 'v' }, 'C', '"_C')
-- cut
map({ 'n', 'v' }, '<leader>x', '"+x', { desc = 'cut text, copy to clipboard' })
map({ 'n', 'v' }, '<leader>X', '"+X', { desc = 'cut text, copy to clipboard' })
map({ 'n', 'v' }, '<leader>d', '"+d', { desc = 'delete text, copy to clipboard' })
map({ 'n', 'v' }, '<leader>D', '"+D', { desc = 'delete text, copy to clipboard' })
-- map({ 'n', 'v' }, '<leader>c', '"+c')
map({ 'n', 'v' }, '<leader>C', '"+C', { desc = 'change text, copy to clipboard' })
-- visual mode retain selection after copying
map('v', 'Y', 'ygv')
-- visual mode replace without copying the deleted text
map('v', 'p', '"_dP')
map('v', 'P', '"_dP')
-- cursor position after paste
map('n', 'P', 'gP')
map('n', 'gP', 'P')
map('n', 'p', 'p`]')
-- z*a as change all text operation
map('n', 'zva', 'ggVG', { desc = 'select all text' })
map('n', 'zya', 'ggVGy', { desc = 'copy all text' })
map('n', 'zda', 'ggVG"_d', { desc = 'delete all text' })
map('n', 'zxa', 'ggVGd', { desc = 'cut all text' })
map('n', 'zca', 'ggVG"_c', { desc = 'change all text' })
-- copy/duplicate lines/block above/below
map('n', 'zk', '""yy""P^', { desc = 'duplicate line to above' })
map('v', 'zk', '""y`<""P`[V`]', { desc = 'duplicate block to above' })
map('n', 'zj', '""yy""p^', { desc = 'duplicate line to below' })
map('v', 'zj', '""y`>""p`[V`]', { desc = 'duplicate block to below' })
-- comment lines/block, then copy/duplicate lines/block above/below
map('n', 'zK', '""yygcc""Pk^', { remap = true, desc = 'comment and duplicate line to above' })
map('v', 'zK', 'gcgv""y`<""P`[V`]gc', { remap = true, desc = 'comment and duplicate block to above' })
map('n', 'zJ', '""yygcc""p^', { remap = true, desc = 'comment and duplicate line to below' })
map('v', 'zJ', 'gcgv""y`>""p`[V`]gc', { remap = true, desc = 'comment and duplicate block to below' })
-- #debug yy is delay, yj/yk somethings will copy the adjacent lines
-- temp fix map all mistake key to copy line
map('n', 'yj', 'yy')
map('n', 'yk', 'yy')
-- `'` as register operator, `gm` as go to mark
map({ 'n', 'v' }, "'", '"')
map({ 'n', 'v' }, 'zm', "'")
-- copy/cut/paste helpers
local function parse_range(opts)
    -- with nargs = '+', at least one arg is supplied
    local arg1 = tonumber(opts.fargs[1])

    if not opts.fargs[2] then
        -- single line
        return arg1
    else
        -- range of lines
        local arg2 = tonumber(opts.fargs[2])
        return arg1 .. ',' .. arg2
    end
end
vim.api.nvim_create_user_command(
    'YankPutBefore',
    function(opts) vim.cmd('' .. parse_range(opts) .. 'yank | put!') end,
    { nargs = '+' }
)
vim.api.nvim_create_user_command(
    'YankPutAfter',
    function(opts) vim.cmd('' .. parse_range(opts) .. 'yank | put') end,
    { nargs = '+' }
)
map('n', 'yP', function() vim.fn.feedkeys(':YankPutBefore ') end)
map('n', 'yp', function() vim.fn.feedkeys(':YankPutAfter ') end)
vim.api.nvim_create_user_command('DeletePutBefore', function(opts)
    vim.cmd('' .. parse_range(opts) .. 'delete')
    vim.api.nvim_feedkeys('``P', 'n', false)
end, { nargs = '+' })
vim.api.nvim_create_user_command('DeletePutAfter', function(opts)
    vim.cmd('' .. parse_range(opts) .. 'delete')
    vim.api.nvim_feedkeys('``p', 'n', false)
end, { nargs = '+' })
map('n', 'dP', function() vim.fn.feedkeys(':DeletePutBefore ') end)
map('n', 'dp', function() vim.fn.feedkeys(':DeletePutAfter ') end)
