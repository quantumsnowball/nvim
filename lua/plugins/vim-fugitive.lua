-- git fugitive
-- https://github.com/tpope/vim-fugitive

local function git_commit_safe(args)
    -- check if ssh-agent has any loaded identities
    vim.fn.system('ssh-add -l')

    -- if there is an active key with ssh-agent, do the git commit normally
    if vim.v.shell_error == 0 then
        vim.cmd('Git commit ' .. (args or ''))
        return
    end

    -- if ssh-agent has not active key, need to add a key first
    -- open a bottom split and start terminal with 'kc'
    vim.cmd('bot split | terminal zsh -i -c "kc"')
    vim.cmd('startinsert')
    -- create a TermClose autocmd only bound to the terminal buffer
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_create_autocmd('TermClose', {
        buffer = buf,
        once = true,
        -- wait for the terminal process to finish and close
        callback = function()
            -- async close the terminal split window and then do the git commit
            vim.schedule(function()
                if vim.api.nvim_buf_is_valid(buf) then
                    vim.api.nvim_buf_delete(buf, { force = true })
                end
                vim.cmd('Git commit ' .. (args or ''))
            end)
        end,
    })
end

local git_push_async = function()
    -- initial notification
    print('Git pushing to remote ...')

    -- exit callback
    local on_exit = function(obj)
        print(obj.code)
        print(obj.signal)
        print(obj.stdout)
        print(obj.stderr)
    end

    -- run shell command asynchronously
    vim.system({ 'git', 'push' }, { text = true }, on_exit)
end

return {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    keys = {
        { '<leader>c', function() git_commit_safe() end, desc = 'Git commit', silent = true },
        { '<leader>a', function() git_commit_safe('--amend') end, desc = 'Git commit --amend', silent = true },
        { '<leader>p', git_push_async, desc = 'Git push', silent = true },
        { '<leader>gc', function() git_commit_safe() end, desc = 'Git commit', silent = true },
        { '<leader>ga', function() git_commit_safe('--amend') end, desc = 'Git commit --amend', silent = true },
        { '<leader>gp', git_push_async, desc = 'Git push', silent = true },
    },
}
