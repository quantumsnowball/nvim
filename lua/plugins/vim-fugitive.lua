-- git fugitive
-- https://github.com/tpope/vim-fugitive

local git_commit_safe = function(args)
    -- check if ssh-agent has any loaded identities
    vim.fn.system('ssh-add -l')
    if vim.v.shell_error ~= 0 then
        -- open a small 10-line bottom split and run your shell function 'kc'
        vim.cmd('botright 10split | terminal zsh -i -c "kc"')
        vim.cmd('startinsert')
        return
    end
    vim.cmd('Git commit ' .. (args or ''))
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
        { '<leader>gc', function() git_commit_safe() end, desc = 'Git commit', silent = true },
        { '<leader>ga', function() git_commit_safe('--amend') end, desc = 'Git commit --amend', silent = true },
        { '<leader>gp', git_push_async, desc = 'Git push', silent = true },
    },
}
