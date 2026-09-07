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
        -- mason-lspconfig will enable all install tools by calling vim.lsp.enable()
        automatic_enable = {
            exclude = {
                -- disable any installed tools here
            },
        },
    },
    init = function()
        -- extra server opts
        local server_opts = {
            bashls = {
                filetypes = { 'sh', 'bash', 'zsh' },
            },
        }
        -- unsupported on termux, need to manually add config here
        local server_opts_termux_specific = {
            lua_ls = {
                cmd = { 'lua-language-server', },
                filetypes = { 'lua', },
            },
            rust_analyzer = {
                cmd = { 'rust-analyzer', },
                filetypes = { 'rust', },
            },
        }
        if os.getenv('TERMUX_VERSION') then
            server_opts = vim.tbl_extend('force', server_opts, server_opts_termux_specific)
        end
        -- config and enable
        for server, opts in pairs(server_opts) do
            vim.lsp.config(server, opts)
            vim.lsp.enable(server)
        end

        -- vim cmd to manually install the some selected tools, use lspconfig naming
        vim.api.nvim_create_user_command('MasonEnsureInstalled', function()
            -- tools
            local tools = {
                -- system
                'tree-sitter-cli',
                -- shell
                'bashls',
                -- python
                'pyright',
                'autopep8',
                -- web dev
                'ts_ls',
                'cssls',
                'html',
                -- data
                'jsonls',
            }
            local tools_termux_unsupported = {
                -- lua
                'lua_ls',
                -- python
                'ruff',
                -- rust
                'rust_analyzer',
            }
            if not os.getenv('TERMUX_VERSION') then
                vim.list_extend(tools, tools_termux_unsupported)
            end
            -- translation to mason names
            local translation = require('mason-lspconfig').get_mappings()
            for i, name in pairs(tools) do
                local mason_name = translation.lspconfig_to_package[name]
                if mason_name then tools[i] = mason_name end
            end
            -- install using MasonInstall command
            local args = table.concat(tools, ' ')
            vim.cmd(':MasonInstall ' .. args)
        end, { desc = 'Install selected Mason tools' })
    end,
}
