-- git fugitive
-- https://github.com/tpope/vim-fugitive

local git_push_async = function()
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
        { '<leader>c', '<cmd>Git commit<cr>',         desc = 'Git commit',         silent = true },
        { '<leader>a', '<cmd>Git commit --amend<cr>', desc = 'Git commit --amend', silent = true },
        { '<leader>P', git_push_async,            desc = 'Git push',           silent = true },
    },
}
