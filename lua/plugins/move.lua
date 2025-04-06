-- move lines or block of code
-- https://github.com/fedepujol/move.nvim
return {
    'fedepujol/move.nvim',
    event = 'VeryLazy',
    opts = {},
    init = function()
        local map = require('utils').map
        local opts = { silent = true }

        -- Normal-mode
        map('n', '<C-down>', '<cmd>MoveLine(1)<cr>', opts)
        map('n', '<C-up>', '<cmd>MoveLine(-1)<cr>', opts)
        map('n', 'gj', '<cmd>MoveLine(1)<cr>', opts)
        map('n', 'gk', '<cmd>MoveLine(-1)<cr>', opts)
        -- map('n', '<A-h>', '<cmd>MoveHChar(-1)<cr>', opts)
        -- map('n', '<A-l>', '<cmd>MoveHChar(1)<cr>', opts)

        -- Visual-mode
        --   ctrl + arrows
        map('v', '<C-down>', '<cmd>MoveBlock(1)<cr>', opts)
        map('v', '<C-up>', '<cmd>MoveBlock(-1)<cr>', opts)
        map('v', '<C-left>', '<cmd>MoveHBlock(-1)<cr>', opts)
        map('v', '<C-right>', '<cmd>MoveHBlock(1)<cr>', opts)
        --   ctrl + hjkl
        map('v', '<C-j>', '<cmd>MoveBlock(1)<cr>', opts)
        map('v', '<C-k>', '<cmd>MoveBlock(-1)<cr>', opts)
        map('v', '<C-h>', '<cmd>MoveHBlock(-1)<cr>', opts)
        map('v', '<C-l>', '<cmd>MoveHBlock(1)<cr>', opts)
        --   g + hjkl
        map('x', 'gj', '<cmd>MoveBlock(1)<cr>', opts)
        map('x', 'gk', '<cmd>MoveBlock(-1)<cr>', opts)
    end
}
