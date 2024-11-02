local map = require('utils').map
---------------
-- clipboard --
---------------
-- delete
map('n', 'x', '"_x')
map('v', 'x', '"_x')
map('n', 'X', '"_X')
map('v', 'X', '"_X')
map('n', 'd', '"_d')
map('v', 'd', '"_d')
map('n', 'D', '"_D')
map('v', 'D', '"_D')
-- replace
map('n', 'c', '"_c')
map('v', 'c', '"_c')
map('n', 'C', '"_C')
map('v', 'C', '"_C')
-- cut
map('n', '<leader>x', '"+x', { desc = 'cut text, copy to clipboard' })
map('v', '<leader>x', '"+x', { desc = 'cut text, copy to clipboard' })
map('n', '<leader>X', '"+X', { desc = 'cut text, copy to clipboard' })
map('v', '<leader>X', '"+X', { desc = 'cut text, copy to clipboard' })
map('n', '<leader>d', '"+d', { desc = 'delete text, copy to clipboard' })
map('v', '<leader>d', '"+d', { desc = 'delete text, copy to clipboard' })
map('n', '<leader>D', '"+D', { desc = 'delete text, copy to clipboard' })
map('v', '<leader>D', '"+D', { desc = 'delete text, copy to clipboard' })
-- map('n', '<leader>c', '"+c')
-- map('v', '<leader>c', '"+c')
map('n', '<leader>C', '"+C', { desc = 'change text, copy to clipboard' })
map('v', '<leader>C', '"+C', { desc = 'change text, copy to clipboard' })
-- visual mode retain selection after copying
map('v', 'Y', 'ygv')
-- visual mode replace without copying the deleted text
map('v', 'p', '"_dP')
map('v', 'P', '"_dP')
-- cursor position after paste
map('n', 'P', 'gP')
map('n', 'gP', 'P')
map('n', 'p', 'p`]')
-- *aa as change all text operation
map('n', 'vaa', 'ggVG', { desc = 'select all text' })
map('n', 'yaa', 'ggVGy', { desc = 'copy all text' })
map('n', 'daa', 'ggVG"_d', { desc = 'delete all text' })
map('n', '<leader>daa', 'ggVGd', { desc = 'cut all text' })
map('n', 'caa', 'ggVG"_c', { desc = 'change all text' })
-- copy/duplicate lines/block above/below
map('n', 'zk', '""yy""P^', { desc = 'duplicate line to above' })
map('v', 'zk', '""y`<""P`[V`]', { desc = 'duplicate block to above' })
map('n', 'zj', '""yy""p$', { desc = 'duplicate line to below' })
map('v', 'zj', '""y`>""p`[V`]', { desc = 'duplicate block to below' })
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
vim.api.nvim_create_user_command('YankPutBefore', function(opts)
    vim.cmd('' .. parse_range(opts) .. 'yank | put!')
end, { nargs = '+' })
vim.api.nvim_create_user_command('YankPutAfter', function(opts)
    vim.cmd('' .. parse_range(opts) .. 'yank | put')
end, { nargs = '+' })
map('n', 'yP', ':YankPutBefore ')
map('n', 'yp', ':YankPutAfter ')
vim.api.nvim_create_user_command('DeletePutBefore', function(opts)
    vim.cmd('' .. parse_range(opts) .. 'delete')
    vim.api.nvim_feedkeys('``P', 'n', false)
end, { nargs = '+' })
vim.api.nvim_create_user_command('DeletePutAfter', function(opts)
    vim.cmd('' .. parse_range(opts) .. 'delete')
    vim.api.nvim_feedkeys('``p', 'n', false)
end, { nargs = '+' })
map('n', 'dP', ':DeletePutBefore ')
map('n', 'dp', ':DeletePutAfter ')
