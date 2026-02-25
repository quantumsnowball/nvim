-- format on save, code prettify
-- https://github.com/stevearc/conform.nvim
return {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    opts = {
        -- enable formatter when useful
        formatters_by_ft = {
            lua = {},
            python = { 'ruff_isort', 'autopep8' },
            json = { 'jq' },
            jsonc = { 'jq' },
            html = { 'prettier' },
            javascript = { 'prettier' },
            javascriptreact = { 'prettier' },
            typescript = { 'prettier' },
            typescriptreact = { 'prettier' },
            css = { 'prettier' },
        },
        formatters = {
            -- Define a surgical Ruff formatter for imports only
            ruff_isort = {
                command = 'ruff',
                args = { 'check', '--select', 'I', '--fix', '--force-exclude', '--exit-zero', '--no-cache', '--stdin-filename', '$FILENAME', '-' },
                stdin = true,
            },
            autopep8 = {
                prepend_args = { '--max-line-length', '999999' },
            },
            jq = {
                append_args = function()
                    return { '--indent', vim.bo.shiftwidth }
                end,
            },
        },
    },
    init = function()
        local map = require('utils').map
        local format = require('conform').format

        -- auto format on save
        vim.api.nvim_create_autocmd('BufWritePre', {
            pattern = '*',
            callback = function(args)
                -- docs:
                -- format(opts, callback)
                -- https://github.com/stevearc/conform.nvim#formatopts-callback
                format({
                    -- as given by official example
                    bufnr = args.buf,
                    -- skip lsp format if given a specific formatter
                    lsp_format = 'fallback',
                    -- milliseconds to block for formatting, default = 1000
                    timeout_ms = 1000,
                })
            end,
        })

        -- manual trigger keymap
        map('n', ';f', format, { desc = 'conform: format current buffer' })
        map('v', ';f', format, { desc = 'conform: format selected lines' })
    end,
}
