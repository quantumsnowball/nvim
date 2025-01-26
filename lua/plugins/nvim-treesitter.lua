local selected_parser = {
    -- neovim
    'lua',
    'vim',
    'vimdoc',
    -- general
    'make',
    'bash',
    'markdown',
    'markdown_inline',
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
}
-- syntax highlighting
-- https://github.com/nvim-treesitter/nvim-treesitter
return {
    'nvim-treesitter/nvim-treesitter',
    event = 'VimEnter',
    build = ':TSUpdate',
    -- why?
    -- because treesitter needs require('nvim-treesitter.configs').setup(opts)
    -- but lazy.nvim default to run require('nvim-treesitter').setup(opts)
    -- that's why without manually pointing the correct setup() location
    -- highlight is not enabled by default, and this one line fix it all
    main = 'nvim-treesitter.configs',
    opts = {
        ensure_installed = {},
        auto_install = true,
        highlight = { enable = true },
        incremental_selection = { enable = true },
        textobjects = { enable = true },
        indent = { enable = false }
    },
    init = function()
        -- allow to install all selected parsers by running these two commands when ready
        -- this prevent from freezing on first run by not using ensure_installed table directly
        vim.api.nvim_create_user_command('TSEnsured', function()
            require("nvim-treesitter.install").ensure_installed(selected_parser)
        end, {})
        vim.api.nvim_create_user_command('TSEnsuredSync', function()
            require("nvim-treesitter.install").ensure_installed_sync(selected_parser)
        end, {})
    end
}
