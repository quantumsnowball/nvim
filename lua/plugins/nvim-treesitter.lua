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
        indent = { enable = false },
    },
    init = function()
        -- allow to install all selected parsers by running this command when ready
        -- this prevent from freezing on first run by not using ensure_installed table directly
        vim.api.nvim_create_user_command(
            'TSEnsureInstalled',
            function() require('nvim-treesitter.install').ensure_installed(selected_parser) end,
            {}
        )

        -- fix for :Inspect not working
        -- ref: https://github.com/neovim/neovim/pull/31676
        -- HACK: Hot patch for issue in Neovim v0.10.3 where vim.hl is not defined
        -- TODO: remove neodev when dropping 0.9 support
        if vim.fn.has('nvim-0.10.3') == 1 and not vim.hl then vim.hl = vim.highlight end
    end,
}
