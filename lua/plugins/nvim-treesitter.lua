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
    build = ':TSUpdate',
    -- event = 'VimEnter',
    opts = {
        ensure_installed = selected_parser,
        ignore_install = { "phpdoc" }, -- can never download successfully on macos
        auto_install = true,
        highlight = { enable = true },
        incremental_selection = { enable = true },
        textobjects = { enable = true },
        indent = { enable = false }
    },
    init = function()
        -- somehow the highligh enable settings doesn't always enable TS highligh
        -- this autocmd ensures the highligh module is enabled when entering a buffer
        vim.cmd('autocmd BufEnter * TSEnable highlight')
    end,
}
