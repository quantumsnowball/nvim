-- syntax highlighting
-- https://github.com/nvim-treesitter/nvim-treesitter
--   requires tree-sitter-cli, can be installed via Mason
return {
    'nvim-treesitter/nvim-treesitter',
    branch = "main",
    event = 'VimEnter',
    build = ':TSUpdate',
}
