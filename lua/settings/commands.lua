-- greeting
vim.api.nvim_create_user_command('MyGreeting', 'echo "Hello world!"', {})

-- swap
vim.api.nvim_create_user_command('ClearAllSwapFiles', function()
    local swapdir = vim.fn.stdpath('state') .. '/swap/*'
    local files = vim.fn.glob(swapdir, true, true)

    if #files == 0 then
        print('No swap files found.')
        return
    end

    for _, file in ipairs(files) do
        vim.fn.delete(file)
    end
    print('Cleared ' .. #files .. ' swap file(s).')
end, {})

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

-- Git
vim.api.nvim_create_user_command('GitConfig', function()
    local git_dir = vim.fn.systemlist('git rev-parse --git-dir')[1]
    if vim.v.shell_error == 0 and git_dir then
        local config_path = git_dir .. '/config'
        vim.cmd('edit ' .. vim.fn.fnameescape(config_path))
    else
        vim.notify('Not inside a Git repository', vim.log.levels.WARN)
    end
end, { desc = 'Open local .git/config' })
