-- enable transparent for all theme
-- https://github.com/xiyaowong/nvim-transparent
return {
    'xiyaowong/nvim-transparent',
    event = 'VeryLazy',
    dependencies = {
        'akinsho/bufferline.nvim'
    },
    opts = {
        -- table/string: additional groups that should be cleared
        extra_groups = {
            -- In particular, when you set it to 'all', that means all available groups
            -- example of akinsho/nvim-bufferline.lua
            -- "BufferLineTabClose",
            -- "BufferLineBufferSelected",
            "BufferLineFill",
            -- "BufferLineBackground",
            -- "BufferLineSeparator",
            -- "BufferLineIndicatorSelected",
            "NormalFloat",
        },
        -- table: groups you don't want to clear
        exclude_groups = {
            "MatchParen",
            "CursorLine",
            "CursorColumn",
            "NeoTreeTabActive",
        },
    },
    init = function()
        -- custom key bindings
        local map = require('utils').map
        -- avaiable commands:
        --   :TransparentEnable
        --   :TransparentDisable
        --   :TransparentToggle
        map('n', '<M-u>', '<cmd>TransparentToggle<cr>')
        map('n', '<F4>', '<cmd>TransparentToggle<cr>')

        -- winbar
        require('transparent').clear_prefix('barbecue')
        require('transparent').clear_prefix('WinBar')

        -- neotree
        require('transparent').clear_prefix('NeoTree')

        -- render markdown
        require('transparent').clear_prefix('RenderMarkdownCode')

        -- telescope
        require('transparent').clear_prefix('Telescope')

        require('transparent').clear_prefix('Bqf')
    end

}
