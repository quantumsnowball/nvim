-- hjkl navigator in neovim and tmux windows
-- vim https://github.com/christoomey/vim-tmux-navigator
-- lua https://github.com/alexghergh/nvim-tmux-navigation
-- TODO: still not able to nav away from neovim
return {
    'alexghergh/nvim-tmux-navigation',
    event = 'VeryLazy',
    opts = {
        disable_when_zoomed = true, -- defaults to false
    },
    init = function()
        local nvim_tmux_nav = require('nvim-tmux-navigation')

        vim.keymap.set('n', '<C-h>', nvim_tmux_nav.NvimTmuxNavigateLeft)
        vim.keymap.set('n', '<C-j>', nvim_tmux_nav.NvimTmuxNavigateDown)
        vim.keymap.set('n', '<C-k>', nvim_tmux_nav.NvimTmuxNavigateUp)
        vim.keymap.set('n', '<C-l>', nvim_tmux_nav.NvimTmuxNavigateRight)
        -- vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
        -- vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end,
}
