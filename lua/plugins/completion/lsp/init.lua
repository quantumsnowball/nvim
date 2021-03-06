local use = require('packer').use


-- LSP support for neovim
use {
    'neovim/nvim-lspconfig',
    config = function()
        -- auto format document on save
        vim.cmd('autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()')
    end
}
-- LSP installer
-- https://github.com/williamboman/nvim-lsp-installer
use {
    'williamboman/nvim-lsp-installer',
    requires = 'neovim/nvim-lspconfig',
    config = function()
        local servers = require('plugins.completion.lsp.servers.names')
        -- ensure installed
        require("nvim-lsp-installer").setup {
            ensure_installed = servers,
            automatic_installation = true,
        }
    end
}
-- LSP enhanced - lspsaga
require('plugins.completion.lsp.lspsaga')
