-- mini.nvim
-- https://github.com/echasnovski/mini.nvim
return {
    'echasnovski/mini.nvim',
    version = false,
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
    end
}
