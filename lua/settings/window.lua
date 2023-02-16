local map = require('utils').map
-------------
-- windows --
-------------
-- quit window shortcut
map('n', 'qw', ':q<cr>')
map('n', 'qW', ':qa<cr>')
map('n', 'qv', ':qa<cr>')
-- toggle split windows
map('n', 'g-', ':split<cr>')
map('n', 'g\\', ':vsplit<cr>')
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
    if (isZoomed) then
        vim.cmd 'wincmd ='
    else
        vim.api.nvim_win_set_width(0, 99999)
        vim.api.nvim_win_set_height(0, 99999)
    end
    isZoomed = not isZoomed
end

map('n', 'gm', toggleMaximize)
