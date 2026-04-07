-- codecompanion
-- https://github.com/olimorris/codecompanion.nvim
return {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    event = 'VeryLazy',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        interactions = {
            chat = {
                adapter = { name = "ollama", model = "qwen2.5-coder:7b" },
            },
            inline = {
                adapter = { name = "ollama", model = "qwen2.5-coder:7b" },
            },
        },
        prompt_library = {
            markdown = {
                dirs = {
                    vim.fn.getcwd() .. "/lua/plugins/codecompapnion.nvim/prompts",
                },
            },
        }
    },
    keys = function()
        -- helpers
        local move_win_bottom = function() vim.cmd('wincmd J') end
        local send_prompt = function() vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-s>", true, false, true)) end

        return {
            -- chats
            { '<leader>ai', ':CodeCompanionChat<cr><c-w>J', desc = 'CodeCompanion Chat', mode = { 'n', 'v' } },
            { '<leader>a-', ':CodeCompanionChat<cr><c-w>J', desc = 'CodeCompanion Chat', mode = { 'n', 'v' } },
            { '<leader>a\\', ':CodeCompanionChat<cr>', desc = 'CodeCompanion Chat (V-Split)', mode = { 'n', 'v' } },
            { '<leader>A', ':CodeCompanionChat<cr><c-w>T', desc = 'CodeCompanion Chat (New Tabpage)', mode = { 'n', 'v' } },
            -- generate commit message
            {
                '<leader>ac',
                function()
                    vim.cmd('CodeCompanion /ai_commit')
                    move_win_bottom()
                end,
                desc = 'CodeCompanion Generate Commit Message (H-Split)'
            },
            -- explain selection
            {
                '<leader>ae',
                function()
                    vim.cmd('CodeCompanion /explain')
                    move_win_bottom()
                    send_prompt()
                end,
                desc = 'CodeCompanion Generate Commit Message (H-Split)',
                mode = 'v'
            },
        }
    end
}
