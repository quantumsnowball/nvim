-- toggle comment line
-- https://github.com/numToStr/Comment.nvim
return {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {},
    init = function()
        local map = require('utils').map
        -- remap <leader>/ to line comment toggle
        map('n', '<leader>/', 'gcc', { remap = true, desc = 'toggle line comment' })
    end
}
