-- indentation line guides
-- https://github.com/lukas-reineke/indent-blankline.nvim
return {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    main = 'ibl',
    opts = function()
        -- define highlight groups
        local highlight = {
            'RainbowRed',
            'RainbowYellow',
            'RainbowBlue',
            'RainbowOrange',
            'RainbowGreen',
            'RainbowViolet',
            'RainbowCyan',
        }
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        local hooks = require('ibl.hooks')
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, highlight[1], { fg = '#E06C75' })
            vim.api.nvim_set_hl(0, highlight[2], { fg = '#E5C07B' })
            vim.api.nvim_set_hl(0, highlight[3], { fg = '#61AFEF' })
            vim.api.nvim_set_hl(0, highlight[4], { fg = '#D19A66' })
            vim.api.nvim_set_hl(0, highlight[5], { fg = '#98C379' })
            vim.api.nvim_set_hl(0, highlight[6], { fg = '#C678DD' })
            vim.api.nvim_set_hl(0, highlight[7], { fg = '#56B6C2' })
        end)
        -- other opts to send to setup()
        -- - left bar char choice: █ ▉ ▊ ▋ ▌ ▍ ▎ ▏
        return {
            indent = {
                char = '▎',
                highlight = highlight,
            },
            scope = {
                enabled = true,
                char = '▊',
                highlight = 'Normal',
            },
        }
    end,
    init = function()
        -- show space and end-of-line
        vim.opt.listchars:append('space:⋅')
        vim.opt.listchars:append('eol:↴')
        -- toggle space and eol chars
        vim.opt.list = false
        require('utils').map('n', '<F6>', '<cmd>set list!<cr>')
        require('utils').map('n', '<space>`', '<cmd>:set list!<cr>')
        -- wrapped lines follow indentation
        vim.opt.breakindent = true
    end,
}
