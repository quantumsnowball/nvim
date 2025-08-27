-- easy multiple line jumping
-- https://github.com/easymotion/vim-easymotion
-- use 'easymotion/vim-easymotion'

-- type the word to jump
-- https://github.com/ggandor/lightspeed.nvim
-- use 'ggandor/lightspeed.nvim'

-- lightspeed successor
-- https://github.com/ggandor/leap.nvim
return {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
    opts = {
        special_keys = {
            repeat_search = '<tab>',
            next_target = '<tab>',
            prev_target = '<s-tab>',
            next_group = ']',
            prev_group = '[',
        },
    },
    init = function() require('leap').set_default_mappings() end,
}
