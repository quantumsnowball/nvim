return {
    -- neovim lsp configs
    -- https://github.com/neovim/nvim-lspconfig
    -- https://github.com/williamboman/mason.nvim,
    -- https://github.com/williamboman/mason-lspconfig.nvim,
    {
        'neovim/nvim-lspconfig',
        event = 'BufReadPre',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
        },
        keys = function()
            -- import
            local tb = require('telescope.builtin')

            -- helpers
            local hover = function() vim.lsp.buf.hover({ border = 'rounded' }) end
            local signature_help = function() vim.lsp.buf.signature_help({ border = 'rounded' }) end
            local next_diagnostic = function() vim.diagnostic.jump({ count = 1, float = true }) end
            local prev_diagnostic = function() vim.diagnostic.jump({ count = -1, float = true }) end

            -- lsp related keymaps
            return {
                -- service
                { '<leader>lr', '<cmd>LspRestart<cr>', desc = 'LSP restart' },
                { '<leader>ll', '<cmd>LspLog<cr>', desc = 'LSP log' },
                { '<leader>li', '<cmd>LspInfo<cr>', desc = 'LSP info' },
                -- editing
                { '<leader>r', vim.lsp.buf.rename, desc = 'LSP rename' },
                -- { ';f',         vim.lsp.buf.format,      desc = 'LSP format code' },
                { 'qf', vim.lsp.buf.code_action, desc = 'LSP code action' },
                -- code inspect
                { 'gr', tb.lsp_references, desc = 'LSP references' },
                { 'gD', vim.lsp.buf.declaration, desc = 'LSP declaration' },
                { 'gd', tb.lsp_definitions, desc = 'LSP definitions' },
                { 'K', hover, desc = 'LSP hover' },
                { 'gi', tb.lsp_implementations, desc = 'LSP implementation' },
                { '<leader>k', signature_help, desc = 'LSP signature help' },
                { '<C-k>', signature_help, desc = 'LSP signature help', mode = 'i' },
                { '<space>D', tb.lsp_type_definitions, desc = 'LSP type definitions' },
                { ']e', next_diagnostic, desc = 'LSP next diagnostic' },
                { '[e', prev_diagnostic, desc = 'LSP previous diagnostic' },
            }
        end,
        init = function()
            vim.diagnostic.config({
                float = {
                    border = 'rounded',
                },
                jump = {
                    float = true,
                },
            })
        end,
    },
    -- mason-lspconfig
    -- https://github.com/williamboman/mason-lspconfig.nvim
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
        },
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
                'cssls',
                'html',
                -- data
                'jsonls',
            }
            -- extra server opts
            local server_opts = {
                bashls = {
                    filetypes = { 'sh', 'bash', 'zsh' },
                },
            }
            -- capabilities supported by completion engine
            local caps = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
            -- activate each LSP
            local translation = require('mason-lspconfig').get_mappings()
            local mason_registry = require('mason-registry')
            local lspconfig = require('lspconfig')
            for _, lspconfig_name in pairs(selected_servers) do
                local opts = {}
                -- inject capabilities
                opts.capabilities = caps
                -- inject extra server opts
                opts = vim.tbl_deep_extend('force', opts, server_opts[lspconfig_name] or {})
                -- lspconfig and mason names are different, mason-lspconfig is the translation
                local mason_name = translation.lspconfig_to_mason[lspconfig_name]
                -- ensure server binary is installed before activating it in lspconfig
                if mason_registry.is_installed(mason_name) then lspconfig[lspconfig_name].setup(opts) end
            end

            -- vim cmd to manually install the selected LSPs
            vim.api.nvim_create_user_command('MasonLSPEnsureInstalled', function()
                local args = table.concat(selected_servers, ' ')
                vim.cmd(':LspInstall ' .. args)
            end, { desc = 'Ensure selected LSP tools are installed using Mason' })
        end,
    },
}
