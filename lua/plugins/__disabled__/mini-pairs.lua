-- auto insert pairs of quotes
-- https://github.com/echasnovski/mini.pairs
return {
    'echasnovski/mini.pairs',
    enabled = false,
    event = 'VeryLazy',
    init = function(_, opts) require('mini.pairs').setup(opts) end,
}
