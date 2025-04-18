return {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufReadPre',
    enabled = false,
    opts = function()
        local null_ls = require('null-ls')
        local opts = {
            sources = {
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.autopep8.with({
                    extra_args = { '--max-line-length', '120' },
                }),
                -- null_ls.builtins.completion.spell,
                -- null_ls.builtins.formatting.stylua,
                -- null_ls.builtins.diagnostics.eslint,
            },
        }
        -- return opts to setup()
        return opts
    end,
}
