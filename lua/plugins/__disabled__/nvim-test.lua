return {
    'klen/nvim-test',
    enabled = false,
    event = 'VeryLazy',
    opts = {
        silent = false,
        termOpts = {
            direction = 'horizontal', -- terminal's direction ("horizontal"|"vertical"|"float")
            height = 10, -- terminal's height (for horizontal|float)
            go_back = true,
        },
    },
    init = function(_, opts)
        require('nvim-test').setup(opts)
        -- @pytest . -k 'not lab' --pdb --workers auto
        require('nvim-test.runners.pytest'):setup({
            command = 'pytest',
            args = { '--workers=auto' },
        })
    end,
}
