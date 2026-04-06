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
                adapter = {
                    name = "ollama",
                    model = "qwen2.5-coder:7b",
                },
            },
        },
    },
    keys = {
        { '<space>ai',  '<cmd>CodeCompanionChat<cr><c-w>J', desc = 'Code Companion Chat (H-Split)' },
        { '<space>a-',  '<cmd>CodeCompanionChat<cr><c-w>J', desc = 'Code Companion Chat (H-Split)' },
        { '<space>a\\', '<cmd>CodeCompanionChat<cr>',       desc = 'Code Companion Chat (V-Split)' },
        { '<space>A',   '<cmd>CodeCompanionChat<cr><c-w>T', desc = 'Code Companion Chat (New Tabpage)' },
    }
}
