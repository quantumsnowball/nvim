-- lazygit version control
-- https://github.com/kdheepak/lazygit.nvim
return {
    'kdheepak/lazygit.nvim',
    event = 'VeryLazy',
    keys = {
        { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
        { '<leader>c', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
    init = function()
        -- config
        -- vim.g.lazygit_floating_window_winblend = 30
        vim.g.lazygit_floating_window_scaling_factor = 1.0
    end
}
