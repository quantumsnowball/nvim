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

-- Define highlights in terms of `colors` and `groups`
G.new('Comment', c.base6, nil)
G.new('Keyword', c.pink, nil)
G.new('Function', c.green, nil)
G.new('String', c.yellow, nil)
G.new('Visual', nil, c.base4)
