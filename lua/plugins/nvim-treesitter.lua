-- syntax highlighting
-- https://github.com/nvim-treesitter/nvim-treesitter
--   requires tree-sitter-cli, can be installed via Mason
return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    event = 'VimEnter',
    build = ':TSUpdate',
    init = function()
        -- for the new nvim-tresitteer at main branch, need to manually enable treesitter
        -- via the build vim.treesitter api, nvim-treesitter no longer handle these
        vim.api.nvim_create_autocmd('FileType', {
            -- here this pattern match all file type, try to start treesitter on everything
            pattern = '*',
            callback = function(ev)
                -- buffer number and type
                local bufnr = ev.buf
                local buftype = vim.bo[bufnr].buftype
                -- empty string means normal buffer, skip all non empty string buftype,
                -- those are non-file buffers (terminals, prompts, floats, etc.)
                if buftype ~= '' then return end
                -- silently attempt to start Treesitter, fails gracefully on any issue
                pcall(vim.treesitter.start, bufnr)
            end,
        })

        -- check health
        vim.api.nvim_create_user_command('TSCheckHealth', function()
            -- Run the built-in health check for nvim-treesitter
            vim.cmd('checkhealth nvim-treesitter')
        end, {
            desc = 'Run nvim-treesitter health check',
        })

        -- declare missing filetype here
        vim.filetype.add({
            extension = {
                xaml = 'xaml',
            },
        })
        -- using an existing parser for another filetype
        for parser, filetypes in pairs({
            xml = { 'xaml' },
            bash = { 'zsh' },
        }) do
            vim.treesitter.language.register(parser, filetypes)
        end

        -- allow to install all selected parsers by running this command when ready
        -- this prevent from freezing on first run by not using ensure_installed table directly
        vim.api.nvim_create_user_command('TSEnsureInstalled', function()
            -- manually install the list above
            require('nvim-treesitter').install({
                -- neovim
                'lua',
                'vim',
                'vimdoc',
                -- general
                'make',
                'bash',
                'markdown',
                'markdown_inline',
                'xml',
                'sql',
                'ini',
                'toml',
                'yaml',
                'regex',
                'comment',
                -- git
                'gitignore',
                'git_rebase',
                'gitcommit',
                'gitattributes',
                -- python
                'python',
                -- webdev
                'tsx',
                'typescript',
                'javascript',
                'css',
                'scss',
                'html',
                'json',
                'json5',
                'vue',
                'http',
                -- web3
                'solidity',
                -- windows
                'c_sharp',
            })
        end, {})
    end,
}
