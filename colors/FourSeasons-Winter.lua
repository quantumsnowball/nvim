local colorbuddy = require('colorbuddy')
local C = colorbuddy.Color
local G = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles


-- setup colorscheme
colorbuddy.colorscheme("FourSeasons-Winter")


-- Colors
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


-- Groups
-- common
G.new('Normal', c.white, c.base2)
G.new('Identifier', c.white, c.base2)
G.new('Comment', c.base6)
G.new('Identifier', c.white)
G.new('Keyword', c.pink)
G.new('Include', c.pink)
G.new('Statement', c.pink)
G.new('Function', c.green)
G.new('String', c.yellow)
G.new('Character', c.yellow)
G.new('Operator', c.pink)
G.new('MatchParen', c.pink)
G.new('Number', c.purple)
G.new('Float', c.purple)
G.new('Boolean', c.purple)
G.new('Type', c.aqua)
G.new('Constant', c.aqua)
G.new('Visual', nil, c.base4)
G.new('Special', c.red)
G.new('Search', nil, c.yellow)
G.new('CursorLineNr', c.orange, c.base2)
G.new('LineNr', c.base5, c.base2)
G.new('ErrorMsg', c.red)
G.new('WarningMsg', c.yellow)
-- Telescope
G.new('TelescopeBorder', c.base7)
G.new('TelescopeNormal', c.base8, c.base0)
G.new('TelescopeSelection', c.white)
G.new('TelescopeSelectionCaret', c.green)
G.new('TelescopeMultiSelection', c.pink)
G.new('TelescopeMatching', c.aqua)
