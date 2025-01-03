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
    'latex',
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
    run = ':TSUpdate',
    event = 'BufReadPost',
    opts = {
        ensure_installed = selected_parser,
        ignore_install = { "phpdoc" },     -- can never download successfully on macos
        highlight = { enable = true },
        incremental_selection = { enable = true },
        textobjects = { enable = true },
        indent = { enable = false }
    },
}
