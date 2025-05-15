-- mason-lspconfig
-- https://github.com/williamboman/mason-lspconfig.nvim
return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        'neovim/nvim-lspconfig',
    },
    opts = {
        -- auto install some servers
        -- ensure_installed = {}
        -- automatic enable all installed and selected server by calling vim.lsp.enable()
        automatic_enable = {
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
        },
    },
    init = function()
        -- extra server opts
        local server_opts = {
            bashls = {
                filetypes = { 'sh', 'bash', 'zsh' },
            },
        }
        for server, opts in pairs(server_opts) do
            vim.lsp.config(server, opts)
        end

        -- vim cmd to manually install the some selected tools, use lspconfig naming
        vim.api.nvim_create_user_command('MasonInstallSelectedTools', function()
            -- selected tools
            local selected_tools = {
                -- lua
                'lua_ls',
                'stylua',
                -- shell
                'bashls',
                -- python
                'pyright',
                'autopep8',
                'isort',
                -- web dev
                'ts_ls',
                'cssls',
                'html',
                -- data
                'jsonls',
            }
            -- translation to mason names
            local translation = require('mason-lspconfig').get_mappings()
            for i, name in pairs(selected_tools) do
                local mason_name = translation.lspconfig_to_package[name]
                if mason_name then selected_tools[i] = mason_name end
            end
            -- install using MasonInstall command
            local args = table.concat(selected_tools, ' ')
            vim.cmd(':MasonInstall ' .. args)
        end, { desc = 'Install selected Mason tools' })
    end,
}
