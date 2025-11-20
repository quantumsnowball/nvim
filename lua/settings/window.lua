local map = require('utils').map
-------------
-- windows --
-------------
-- quit window shortcut
map('n', ';q', '<cmd>q<cr>', { desc = 'quit window' })
map('n', 'qw', '<cmd>q<cr>', { desc = 'quit window' })
map('n', 'qW', '<cmd>qa<cr>', { desc = 'quit all windows' })
map('n', 'qq', '<cmd>qa<cr>', { desc = 'quit neovim' })
map('n', 'qQ', '<cmd>qa!<cr>', { desc = 'quit neovim (force)' })
-- toggle split windows
map('n', 'g_', '<cmd>split<cr><c-w>k', { desc = 'split horizontally, cursor stay top' })
map('n', 'g-', '<cmd>split<cr>', { desc = 'split horizontally, cursor to bottom' })
map('n', 'g|', '<cmd>vsplit<cr><c-w>h', { desc = 'split vertically, cursor stay left' })
map('n', 'g\\', '<cmd>vsplit<cr>', { desc = 'split vertically, cursor to right' })
-- split and jump to file start or end
map('n', 'q_', '<cmd>split<cr><c-w>kgg', { desc = 'split horizontally, cursor stay top, jump to file start' })
map('n', 'qi', '<cmd>split<cr><c-w>kgg', { desc = 'split horizontally, cursor stay top, jump to file start' })
map('n', 'q-', '<cmd>split<cr>G', { desc = 'split horizontally, cursor to bottom, jump to file end' })
-- window rotation
map('n', 'q]', '<c-w>r', { desc = 'rotate windows (forward)' })
map('n', 'q[', '<c-w>R', { desc = 'rotate windows (backward)' })
-- window docking to side
map('n', 'qh', '<c-w>H', { desc = 'dock window to left' })
map('n', 'qj', '<c-w>J', { desc = 'dock window to bottom' })
map('n', 'qk', '<c-w>K', { desc = 'dock window to top' })
map('n', 'ql', '<c-w>L', { desc = 'dock window to right' })

-- simple custom function
-- toggle maximize pane and restore
local isZoomed = false

local function toggleMaximize()
    if isZoomed then
        vim.cmd('wincmd =')
    else
        vim.api.nvim_win_set_width(0, 99999)
        vim.api.nvim_win_set_height(0, 99999)
    end
    isZoomed = not isZoomed
end

map('n', 'gm', toggleMaximize, { desc = 'toggle maximize window' })
