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
            "hrsh7th/nvim-cmp",
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
            -- desiered server
            local selected_servers = {
                -- lua
                'lua_ls',
                -- shell
                'bashls',
                -- python
                'pyright',
                -- web dev
                'ts_ls',
                "cssls",
                "html",
                -- data
                "jsonls",
            }
            -- extra server opts
            local server_opts = {
                bashls = {
                    filetypes = { 'sh', 'bash', 'zsh' }
                },
            }
            -- activate LSP
            local caps = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
            local function activate(lspconfig_name, opts)
                opts = opts or {}
                opts.capabilities = caps
                opts = vim.tbl_deep_extend('force', opts, server_opts[lspconfig_name] or {})
                -- lspconfig and mason names are different, mason-lspconfig is the translation
                local translation = require('mason-lspconfig').get_mappings()
                local mason_name = translation.lspconfig_to_mason[lspconfig_name]
                -- ensure server binary is installed before activating it in lspconfig
                if require('mason-registry').is_installed(mason_name) then
                    require("lspconfig")[lspconfig_name].setup(opts)
                end
            end
            for _, name in pairs(selected_servers) do
                activate(name)
            end

            -- vim cmd to manually install the selected LSPs
            vim.api.nvim_create_user_command('MasonLSPEnsureInstalled', function()
                local args = table.concat(selected_servers, " ")
                vim.cmd(":LspInstall " .. args)
            end, { desc = "Ensure selected LSP tools are installed using Mason" })
        end
    }
}
