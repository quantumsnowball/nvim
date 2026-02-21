-- debug ui for nvim-dap
-- https://github.com/rcarriga/nvim-dap-ui
-- refer to :h dapui.setup()
local opts = {
    layouts = {
        {
            elements = {
                {
                    id = 'breakpoints',
                    size = 0.10,
                },
                {
                    id = 'stacks',
                    size = 0.15,
                },
                {
                    id = 'scopes',
                    size = 0.50,
                },
                {
                    id = 'watches',
                    size = 0.25,
                },
            },
            position = 'left',
            size = 50,
        },
        {
            elements = {
                {
                    id = 'repl',
                    size = 0.6,
                },
                {
                    id = 'console',
                    size = 0.4,
                },
            },
            position = 'bottom',
            size = 10,
        },
    },
    mappings = {
        expand = { 'h', 'l', '<cr>', '<2-LeftMouse>' },
    },
}

return {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio',
    },
    keys = {
        { '<F7>', function() require('dapui').toggle({ reset = true }) end, desc = 'nvim-dap-ui.toggle()' },
    },
    init = function()
        -- events
        local dapui = require('dapui')
        dapui.setup(opts)
        local dap = require('dap')
        dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
        dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
        dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
        -- icons
        vim.fn.sign_define('DapBreakpoint', { text = '🛑' })
        vim.fn.sign_define('DapBreakpointCondition', { text = '🟡' })
        vim.fn.sign_define('DapLogPoint', { text = '🏁' })
        vim.fn.sign_define('DapStopped', { text = '' })
        vim.fn.sign_define('DapBreakpointRejected', { text = '✋' })
    end,
}
