local colorbuddy = require('colorbuddy')
local C = colorbuddy.Color
local G = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles


-- setup colorscheme
colorbuddy.colorscheme("FourSeasons-Winter")


-- colors
C.new('base0', '#191515')
C.new('base1', '#211c1c')
C.new('base2', '#2c2525')
C.new('base3', '#403838')
C.new('base4', '#5b5353')
C.new('base5', '#72696a')
C.new('base6', '#8c8384')
C.new('base7', '#c3b7b8')
C.new('base8', '#fff1f3')
C.new('border', '#A1B5B1')
C.new('brown', '#352e2e')
C.new('white', '#fff1f3')
C.new('grey', '#72696a')
C.new('black', '#000000')
C.new('pink', '#FF6188')
C.new('green', '#adda78')
C.new('aqua', '#85dacc')
C.new('yellow', '#f9cc6c')
C.new('orange', '#f38d70')
C.new('purple', '#a8a9eb')
C.new('red', '#fd6883')
C.new('diff_add', '#527728')
C.new('diff_remove', '#842335')
C.new('diff_change', '#247c6e')
C.new('diff_text', '#23324d')


-- groups
-- common
G.new('Normal', c.white, c.base2)
G.new('Identifier', c.white, c.base2)
G.new('Comment', c.base6, nil)
G.new('Identifier', c.white, nil)
G.new('Keyword', c.pink, nil)
G.new('Include', c.pink, nil)
G.new('Statement', c.pink, nil)
G.new('Function', c.green, nil)
G.new('String', c.yellow, nil)
G.new('Character', c.yellow, nil)
G.new('Operator', c.pink, nil)
G.new('MatchParen', c.pink, nil)
G.new('Number', c.purple, nil)
G.new('Float', c.purple, nil)
G.new('Boolean', c.purple, nil)
G.new('Type', c.aqua, nil)
G.new('Constant', c.aqua, nil)
G.new('Visual', nil, c.base4)
G.new('Special', c.red, nil)
G.new('Search', nil, c.yellow)
G.new('CursorLineNr', c.orange, c.base2)
G.new('LineNr', c.base5, c.base2)
G.new('ErrorMsg', c.red, nil)
G.new('WarningMsg', c.yellow, nil)
-- Telescope
G.new('TelescopeBorder', c.base7, nil)
G.new('TelescopeNormal', c.base8, c.base0)
G.new('TelescopeSelection', c.white, nil)
G.new('TelescopeSelectionCaret', c.green, nil)
G.new('TelescopeMultiSelection', c.pink, nil)
G.new('TelescopeMatching', c.aqua, nil)
