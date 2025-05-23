-- Better `vim.notify()`
-- https://github.com/rcarriga/nvim-notify
return {
    'rcarriga/nvim-notify',
    enabled = false,
    keys = {
        {
            'zn',
            function() require('notify').dismiss({ silent = true, pending = true }) end,
            desc = 'Delete all Notifications',
        },
    },
    opts = {
        timeout = 3000,
        max_height = function() return math.floor(vim.o.lines * 0.75) end,
        max_width = function() return math.floor(vim.o.columns * 0.75) end,
        background_colour = '#ffffff',
    },
}
