return {
    -- neovim lsp configs
    -- https://github.com/neovim/nvim-lspconfig
    -- https://github.com/williamboman/mason.nvim,
    -- https://github.com/williamboman/mason-lspconfig.nvim,
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        }
    },
    -- cmdline tools and lsp servers
    -- https://github.com/williamboman/mason.nvim
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" } },
        opts = {}
    },
    -- mason-lspconfig
    -- https://github.com/williamboman/mason-lspconfig.nvim
    {
        "williamboman/mason-lspconfig.nvim",
        keys = require('plugins.nvim-lspconfig.keymaps'),
        config = function()
            -- auto install some servers
            local list = require('plugins.nvim-lspconfig.constants').ensure_installed
            require("mason-lspconfig").setup { ensure_installed = list }
            -- neovim's default capabilities
            local caps = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
            --
            -- lsp server settings
            --
            -- 1. use Mason to install the server
            -- 2. add the correct name to this lise
            -- 3. to provide extra configs, create a module with the exact name and return the table
            -- TODO I can't print any message inside the config(), hard to debug vars. #debug
            local selected = {
                'lua_ls',
                'pyright',
                'ts_ls', -- 'tsserver'
                "cssls",
                "jsonls",
                "html",
            }
            for _, name in pairs(selected) do
                require('plugins.nvim-lspconfig.lsp')(name, caps)
            end
            -- auto format document on save
            vim.cmd('autocmd BufWritePre * silent! lua vim.lsp.buf.format({async=false})')
        end
    }
}
