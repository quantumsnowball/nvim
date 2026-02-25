-- mini.nvim
-- https://github.com/echasnovski/mini.nvim
return {
    'echasnovski/mini.nvim',
    version = false,
    event = 'VeryLazy',
    config = function()
        require('mini.ai').setup({
            mappings = {
                -- remove g[ and g] bindings for other uses
                goto_left = '',
                goto_right = '',
            },
        })

        require('mini.splitjoin').setup({
            -- Module mappings. Use `''` (empty string) to disable one.
            -- Created for both Normal and Visual modes.
            mappings = {
                toggle = 'gs',
                split = '',
                join = '',
            },
        })

        require('mini.move').setup({
            mappings = {
                -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                left = '',
                right = '',
                down = 'gj',
                up = 'gk',
                -- Move current line in Normal mode
                line_left = '',
                line_right = '',
                line_down = 'gj',
                line_up = 'gk',
            },
        })

        require('mini.cursorword').setup({
            --
        })

        require('mini.hipatterns').setup({
            highlighters = {
                -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
            },
        })

        require('mini.trailspace').setup({
            --
        })

        require('mini.operators').setup({
            -- set prefix to '' to disable any feature
            evaluate = { prefix = 'g=' }, -- Evaluate text and replace with output
            exchange = { prefix = 'gx' }, -- Exchange text regions
            multiply = { prefix = 'zm' }, -- Multiply (duplicate) text
            replace = { prefix = 'zr' }, --  Replace text with register
            sort = { prefix = 'zs' }, -- Sort text
        })
    end,
}
