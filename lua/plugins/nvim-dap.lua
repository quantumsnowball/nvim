-- debug adapter for neovim
-- https://github.com/mfussenegger/nvim-dap
return {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    keys = {
        { ';b',        function() require('dap').toggle_breakpoint() end, desc = 'nvim-dap.toggle_breakpoint()' },
        { ';B', function()
            require('dap').set_breakpoint(vim.fn.input('Condition: '))
        end, desc = 'nvim-dap.set_breakpoint(Condition)' },
        { '<space>dc', function() require('dap').clear_breakpoints() end, desc = 'nvim-dap.clear_breakpoints()' },
        { '<F8>',      function() require('dap').continue() end,          desc = 'nvim-dap.continue()' },
        { '<space>c',  function() require('dap').continue() end,          desc = 'nvim-dap.continue()' },
        { '<space>i',  function() require('dap').step_into() end,         desc = 'nvim-dap.into()' },
        { '<space>u',  function() require('dap').step_out() end,          desc = 'nvim-dap.out()' },
        { '<space>o',  function() require('dap').step_over() end,         desc = 'nvim-dap.step_over()' },
        { '<space>p',  function() require('dap').step_back() end,         desc = 'nvim-dap.step_back()' },
        { '<space>k',  function() require('dap').up() end,                desc = 'nvim-dap.up() [older]' },
        { '<space>j',  function() require('dap').down() end,              desc = 'nvim-dap.down() [newer]' },
        { '<F10>',     function() require('dap').terminate() end,         desc = 'nvim-dap.terminate()' },
        { '<space>de', function() require('dap').terminate() end,         desc = 'nvim-dap.terminate()' },
    },
    init = function()
        local dap = require("dap")
        dap.listeners.after.event_initialized['dap_config'] = function()
            require('dap').set_exception_breakpoints({ "raised", "uncaught" })
            print('set_exception_breakpoints({ "raised", "uncaught" })')
        end
    end
}
