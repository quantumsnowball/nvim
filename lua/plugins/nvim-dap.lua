-- debug adapter for neovim
-- https://github.com/mfussenegger/nvim-dap
return {
    {
        'mfussenegger/nvim-dap',
        event = 'VeryLazy',
        keys = {
            { ';b',        function() require('dap').toggle_breakpoint() end },
            { '<F9>',      function() require('dap').continue() end },
            { '<space>ds', function() require('dap').continue() end },
            { '<F10>',     function() require('dap').terminate() end },
            { '<space>de', function() require('dap').terminate() end },
        }
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = 'mfussenegger/nvim-dap',
        event = 'VeryLazy',
        keys = {
            { '<F7>', function() require('dapui').toggle() end },
        },
        config = function()
            local dapui = require("dapui")
            dapui.setup()
            local dap = require("dap")
            dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
            dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
        end
    },
    {
        'mfussenegger/nvim-dap-python',
        dependencies = 'mfussenegger/nvim-dap',
        event = 'VeryLazy',
        keys = {
            { '<F7>', function() require('dapui').toggle() end },
        },
        config = function()
            require('dap-python').setup('python')
            require('dap-python').test_runner = 'pytest'
        end
    }
}
