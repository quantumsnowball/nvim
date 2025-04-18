-- BUG
--
-- The may app randomly freeze on all functions, making neovim not responding at all
-- some problem about launchingg the subprocess since version 1.37.0
-- I go to the source code `lua/neotest/client/init.lua` and commented out the following lines:
-- ```
-- if not lib.subprocess.enabled() then
--   lib.subprocess.init()
-- end
-- ```
-- (Line 336 in 63d1806)
-- after this hack the app appear to run normally
--
-- I have to create my own fork to fix this

return {
    {
        'quantumsnowball/neotest',
        enabled = false,
        branch = 'removed-lib.subprocess.init',
        event = 'VeryLazy',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'antoinemadec/FixCursorHold.nvim',
        },
        keys = {
            { '<leader>TT', function() require('neotest').run.run() end, desc = 'neotest.run.run()' },
            {
                '<leader>TS',
                function() require('neotest').summary.toggle() end,
                desc = 'neotest.summary.toggle()',
            },
            {
                '<leader>TO',
                function() require('neotest').output_panel.toggle() end,
                desc = 'neotest.summary.output()',
            },
        },
        opts = {},
    },
    {
        -- adapters
        'nvim-neotest/neotest-python',
        enabled = false,
        event = 'VeryLazy',
        dependencies = {
            'quantumsnowball/neotest',
        },
        init = function()
            -- @pytest . -k 'not lab' --pdb --workers auto
            require('neotest').setup({
                adapters = {
                    require('neotest-python')({
                        -- runner = 'pytest',
                        -- args = { "-k 'not lab'" }
                        -- pytest-parallel not working
                        -- args = { '--workers', 'auto' }
                    }),
                },
            })
        end,
    },
}
