-- greeting
vim.api.nvim_create_user_command('MyGreeting', 'echo "Hello world!"', {})

-- LSP
vim.api.nvim_create_user_command('MyLSPServerCaps', function()
    -- LSPs should be `servers`
    -- may be think of these are wrapper clients attaching to each server
    local wrappers = vim.lsp.get_active_clients()
    for _, wrapper in pairs(wrappers) do
        print('LSP server, ' .. wrapper.name .. ', capabilities =')
        print(vim.inspect(wrapper.server_capabilities))
    end
end, {})
vim.api.nvim_create_user_command('MyLSPServerSettings', function()
    -- LSPs should be `servers`
    -- may be think of these are wrapper clients attaching to each server
    local wrappers = vim.lsp.get_active_clients()
    for _, wrapper in pairs(wrappers) do
        print('LSP server: ' .. wrapper.name .. ', settings =')
        -- debug
        -- for k, _ in pairs(wrapper.config) do
        --     print(vim.inspect(k))
        -- end
        print(vim.inspect(wrapper.config.settings))
    end
end, {})
vim.api.nvim_create_user_command('MyLSPClientCaps', function()
    print('LSP client: Neovim, capabilities =')
    local caps = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    print(vim.inspect(caps))
end, {})
vim.api.nvim_create_user_command(
    'MyTypeScriptOrganizeImports',
    function()
        vim.lsp.buf.execute_command({
            command = '_typescript.organizeImports',
            arguments = { vim.api.nvim_buf_get_name(0) },
        })
    end,
    {}
)
