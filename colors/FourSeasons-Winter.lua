-- colors
local colors = {
    base0 = '#191515',
    base1 = '#211c1c',
    base2 = '#2c2525',
    base3 = '#403838',
    base4 = '#5b5353',
    base5 = '#72696a',
    base6 = '#8c8384',
    base7 = '#c3b7b8',
    base8 = '#fff1f3',
    border = '#A1B5B1',
    brown = '#352e2e',
    white = '#fff1f3',
    grey = '#72696a',
    black = '#000000',
    pink = '#FF6188',
    green = '#adda78',
    aqua = '#85dacc',
    yellow = '#f9cc6c',
    orange = '#f38d70',
    purple = '#a8a9eb',
    red = '#fd6883',
    diff_add = '#527728',
    diff_remove = '#842335',
    diff_change = '#247c6e',
    diff_text = '#23324d',
}

-- setup
require('settings.colorscheme.highlight').setup(colors)
