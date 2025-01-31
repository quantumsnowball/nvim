-- mini.nvim
-- https://github.com/echasnovski/mini.nvim
return {
    'echasnovski/mini.nvim',
    version = false,
    event = 'VeryLazy',
    config = function()
        require('mini.ai').setup({
            --
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

        require('mini.pairs').setup({
            --
        })

        require('mini.cursorword').setup({
            --
        })

        require('mini.hipatterns').setup({
            highlighters = {
                -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                hack  = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                todo  = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                note  = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
            },
        })

        require('mini.trailspace').setup({
            --
        })
    end
}
