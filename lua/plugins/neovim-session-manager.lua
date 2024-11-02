-- session manager
-- https://github.com/Shatur/neovim-session-manager
return {
    'Shatur/neovim-session-manager',
    init = function()
        -- plugin custom
        require('session_manager').setup({
            -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
            autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir,
            -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
            autosave_ignore_not_normal = false,
        })

        -- autoload Alpha screen when there is only a [No Name] empty buffer exists
        local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {}) -- A global group for all your config autocommands
        vim.api.nvim_create_autocmd({ 'User' }, {
            pattern = "SessionLoadPost",
            group = config_group,
            callback = function()
                local bufs = vim.api.nvim_list_bufs()
                local bufs_n = #bufs
                local buf_id = bufs[1]
                -- vim.print(buf_id)
                local buffer_name = vim.api.nvim_buf_get_name(buf_id)
                if bufs_n == 1 and buffer_name == '' then
                    vim.cmd('Alpha')
                    vim.api.nvim_buf_delete(buf_id, {})
                end
            end,
        })
    end
}
