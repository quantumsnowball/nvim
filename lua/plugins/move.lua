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
        -- NOTE: only work in :, not <cmd>
        --   ctrl + arrows
        map('v', '<C-down>', ':MoveBlock(1)<cr>', opts)
        map('v', '<C-up>', ':MoveBlock(-1)<cr>', opts)
        map('v', '<C-left>', ':MoveHBlock(-1)<cr>', opts)
        map('v', '<C-right>', ':MoveHBlock(1)<cr>', opts)
        --   ctrl + hjkl
        map('v', '<C-j>', ':MoveBlock(1)<cr>', opts)
        map('v', '<C-k>', ':MoveBlock(-1)<cr>', opts)
        map('v', '<C-h>', ':MoveHBlock(-1)<cr>', opts)
        map('v', '<C-l>', ':MoveHBlock(1)<cr>', opts)
        --   g + hjkl
        map('v', 'gj', ':MoveBlock(1)<cr>', opts)
        map('v', 'gk', ':MoveBlock(-1)<cr>', opts)
    end
}
