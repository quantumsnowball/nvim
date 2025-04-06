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

        -- clear prefix
        local clear_prefix = require('transparent').clear_prefix
        -- winbar
        clear_prefix('barbecue')
        clear_prefix('WinBar')

        -- neotree
        clear_prefix('NeoTree')

        -- render markdown
        clear_prefix('RenderMarkdownCode')

        -- telescope
        clear_prefix('Telescope')

        clear_prefix('Bqf')
    end

}
