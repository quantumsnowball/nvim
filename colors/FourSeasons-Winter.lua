-- file: colors/my-colorscheme-name.lua

local colorbuddy = require('colorbuddy')

-- Set up your custom colorscheme if you want
colorbuddy.colorscheme("FourSeasons-Winter")

-- And then modify as you like
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

-- Use Color.new(<name>, <#rrggbb>) to create new colors
-- They can be accessed through colors.<name>
Color.new('base0', '#191515')
Color.new('base1', '#211c1c')
Color.new('base2', '#2c2525')
Color.new('base3', '#403838')
Color.new('base4', '#5b5353')
Color.new('base5', '#72696a')
Color.new('base6', '#8c8384')
Color.new('base7', '#c3b7b8')
Color.new('base8', '#fff1f3')
Color.new('border', '#A1B5B1')
Color.new('brown', '#352e2e')
Color.new('white', '#fff1f3')
Color.new('grey', '#72696a')
Color.new('black', '#000000')
Color.new('pink', '#FF6188')
Color.new('green', '#adda78')
Color.new('aqua', '#85dacc')
Color.new('yellow', '#f9cc6c')
Color.new('orange', '#f38d70')
Color.new('purple', '#a8a9eb')
Color.new('red', '#fd6883')

-- Define highlights in terms of `colors` and `groups`
Group.new('Comment', colors.base6, colors.base0, styles.bold)
Group.new('Function', colors.green, colors.base0, styles.bold)
Group.new('String', colors.yellow, colors.base0, styles.bold)
Group.new('luaFunctionCall', groups.Function, groups.Function, groups.Function)

-- Define highlights in relative terms of other colors
-- Group.new('Error', colors.red:light(), nil, styles.bold)

-- If you want multiple styles, just add them!
-- Group.new('italicBoldFunction', colors.green, groups.Function, styles.bold + styles.italic)

-- If you want the same style as a different group, but without a style: just subtract it!
-- Group.new('boldFunction', colors.yellow, colors.background, groups.italicBoldFunction - styles.italic)
