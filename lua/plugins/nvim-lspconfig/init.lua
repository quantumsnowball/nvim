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
        },
        init = function()
            vim.diagnostic.config({
                float = {
                    border = 'rounded'
                },
                jump = {
                    float = true
                }
            })
        end
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
        opts = {
            -- auto install some servers
            -- ensure_installed = {}
        },
        init = function()
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
            -- neovim's default capabilities
            local caps = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
            local lspconfig = require('lspconfig')

            -- for _, name in pairs(selected) do
            --     require('plugins.nvim-lspconfig.lsp')(name, caps)
            -- end
            --
            -- init caps
            -- lua_ls
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })
            -- pyright
            lspconfig.pyright.setup({})




            -- manually install the selected LSPs
            -- vim.api.nvim_create_user_command('MasonLSPEnsureInstalled', function()
            --     local args = table.concat(selected, " ")
            --     vim.cmd(":LspInstall " .. args)
            -- end, { desc = "Ensure selected LSP tools are installed using Mason" })
        end
    }
}
