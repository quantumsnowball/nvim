-- colors
local colors = {
    base0 = '#222426',
    base1 = '#211F22',
    base2 = '#26292C',
    base3 = '#2E323C',
    base4 = '#333842',
    base5 = '#4d5154',
    base6 = '#72696A',
    base7 = '#B1B1B1',
    base8 = '#e3e3e1',
    border = '#A1B5B1',
    brown = '#504945',
    white = '#f6f6ec',
    grey = '#72696A',
    black = '#000000',
    pink = '#f3005f',
    green = '#97e023',
    aqua = '#78DCE8',
    yellow = '#dfd561',
    orange = '#fa8419',
    purple = '#9c64fe',
    red = '#f3005f',
    diff_add = '#3d5213',
    diff_remove = '#4a0f23',
    diff_change = '#27406b',
    diff_text = '#23324d',
}

-- setup
require('settings.colorscheme.highlight').setup(colors)
