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
        -- -- desiered server
        -- local selected_servers = {
        --     -- lua
        --     'lua_ls',
        --     -- shell
        --     'bashls',
        --     -- python
        --     'pyright',
        --     -- web dev
        --     'ts_ls',
        --     'cssls',
        --     'html',
        --     -- data
        --     'jsonls',
        -- }

        -- extra server opts
        local server_opts = {
            bashls = {
                filetypes = { 'sh', 'bash', 'zsh' },
            },
        }
        for server, opts in pairs(server_opts) do
            vim.lsp.config(server, opts)
        end

        -- vim cmd to manually install the selected LSPs
        vim.api.nvim_create_user_command('MasonLSPEnsureInstalled', function()
            local args = table.concat(selected_servers, ' ')
            vim.cmd(':LspInstall ' .. args)
        end, { desc = 'Ensure selected LSP tools are installed using Mason' })
    end,
}
