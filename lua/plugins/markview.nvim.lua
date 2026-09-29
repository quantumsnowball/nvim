-- markview.nvim
-- https://github.com/OXY2DEV/markview.nvim
return {
    'OXY2DEV/markview.nvim',
    lazy = false,
    opts = {},
    keys = {
        { 'zp', '<CMD>Markview<CR>', desc = 'Toggles `markview` previews globally.' },
        { 'z\\', '<CMD>Markview splitToggle<CR>', desc = 'Toggles `splitview` for current buffer.' },
    },
}
