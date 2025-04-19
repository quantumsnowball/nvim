-- mason-lspconfig
-- https://github.com/williamboman/mason-lspconfig.nvim
return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/nvim-cmp',
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
}
