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
    -- default config ref:
    -- https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
    opts = {
        opts = {
            -- use TRACE or DEBUG for debug
            -- log_level = 'TRACE',
        },
        display = {
            action_palette = {
                provider = 'default',
            },
            chat = {
                auto_scroll = false,
                start_in_insert_mode = true,
                window = {
                    layout = "horizontal",
                    height = 0.5,
                    position = "bottom",
                },
            },
        },
        adapters = {
            http = {
                ["ollama-nothink"] = function()
                    return require("codecompanion.adapters.http").extend("ollama", {
                        schema = {
                            think = { default = false },
                        },
                    })
                end,
            },
        },
        interactions = {
            chat = {
                adapter = {
                    name = "ollama-nothink",
                    model = "qwen3.5:4b"
                },
                keymaps = {
                    stop = {
                        modes = { n = "gq" },
                        index = 5,
                        callback = "keymaps.stop",
                        description = "[Request] Stop",
                    }
                }
            },
            inline = {
                adapter = {
                    name = "ollama-nothink",
                    model = "qwen3.5:4b",
                    temperature = 0.1,
                },
            },
        },
        prompt_library = {
            markdown = {
                dirs = {
                    os.getenv('XDG_CONFIG_HOME') .. "/nvim/lua/plugins/codecompapnion.nvim/prompts",
                },
            },
        }
    },
    keys = function()
        -- helpers
        local send_prompt = function() vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-s>", true, false, true)) end

        return {
            -- action palette
            { '<leader>ap', ':CodeCompanionActions<cr>', desc = 'CodeCompanion Action Palette', mode = { 'n', 'v' } },
            -- chats
            { '<leader>ai', ':CodeCompanionChat<cr>', desc = 'CodeCompanion Chat', mode = { 'n', 'v' } },
            { '<leader>a-', ':CodeCompanionChat<cr>', desc = 'CodeCompanion Chat', mode = { 'n', 'v' } },
            { '<leader>a\\', ':CodeCompanionChat<cr><c-w>L', desc = 'CodeCompanion Chat (V-Split)', mode = { 'n', 'v' } },
            { '<leader>A', ':CodeCompanionChat<cr><c-w>T', desc = 'CodeCompanion Chat (New Tabpage)', mode = { 'n', 'v' } },
            -- generate commit message
            {
                '<leader>ac',
                function()
                    vim.cmd('Git commit')
                    vim.cmd('CodeCompanion /ai_commit_inline')
                end,
                desc = 'CodeCompanion Generate Commit Message Inline'
            },
            {
                '<leader>aC',
                function()
                    vim.cmd('CodeCompanion /ai_commit_chat')
                end,
                desc = 'CodeCompanion Generate Commit Message in Chat'
            },
            -- explain selection
            {
                '<leader>ae',
                function()
                    vim.cmd('CodeCompanion /explain')
                    send_prompt()
                end,
                desc = 'CodeCompanion Generate Commit Message (H-Split)',
                mode = 'v'
            },
        }
    end
}
