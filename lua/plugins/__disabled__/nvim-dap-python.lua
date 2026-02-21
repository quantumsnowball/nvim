-- python settings for nvim-dap
-- https://github.com/mfussenegger/nvim-dap-python
return {
    'mfussenegger/nvim-dap-python',
    event = 'VeryLazy',
    dependencies = 'mfussenegger/nvim-dap',
    keys = {
        { '<space>dt', function() require('dap-python').test_method() end, desc = 'nvim-dap-python.test_method()' },
        { '<F9>', function() require('dap-python').test_method() end, desc = 'nvim-dap-python.test_method()' },
    },
    init = function()
        require('dap-python').setup('python')
        -- require('dap-python').test_runner = 'pytest'
    end,
}
