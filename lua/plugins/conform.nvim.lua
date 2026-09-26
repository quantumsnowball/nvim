-- format on save, code prettify
-- https://github.com/stevearc/conform.nvim
return {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    opts = {
        -- enable formatter when useful
        formatters_by_ft = {
            lua = {},
            python = { 'ruff_fix', 'autopep8' },
            json = { 'jq' },
            jsonc = { 'jq' },
            html = { 'prettier' },
            javascript = { 'prettier' },
            javascriptreact = { 'prettier' },
            typescript = { 'prettier' },
            typescriptreact = { 'prettier' },
            css = { 'prettier' },
            rust = { 'rustfmt' },
            -- ["*"] = { 'fix_indent', 'trim_whitespace', 'trim_newlines', 'squeeze_blanks', }
        },
        formatters = {
            -- Define a surgical Ruff formatter for imports only
            ruff_fix = {
                command = vim.fn.exepath('ruff'),
                args = { 'check', '--select', 'I,Q', '--fix', '--force-exclude', '--exit-zero', '--no-cache', '--stdin-filename', '$FILENAME', '-' },
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
            prettier = {
                prepend_args = {
                    '--tab-width', '4',
                    '--single-quote'
                },
            },
            rustfmt = {
                args = {
                    -- longer max_width prevent auto break long line, use fake comment line // to prevent force joining lines by formatter
                    "--emit", "stdout",
                    "--edition", "2024",
                    "--config", "max_width=120",
                    "--config", 'use_small_heuristics=Max', -- prevent early line break well below max_width
                },
            },
            fix_indent = {
                format = function(self, ctx, callback)
                    -- Save cursor, gg=G fix indent, then jump back
                    local view = vim.fn.winsaveview()
                    vim.cmd('keepjumps normal! gg=G')
                    vim.fn.winrestview(view)
                    callback(nil)
                end,
            },
        },
        default_format_opts = {
            lsp_format = 'fallback',
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
