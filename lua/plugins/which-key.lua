-- pop up for keymap hints
-- https://github.com/folke/which-key.nvim
return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        -- classic, modern, and helix
        preset = "modern",
        triggers = {
            { "<auto>", mode = "nixsotc" },
            -- put missing trigger key here
            { "q",      mode = { "n" } },
            { "t",      mode = { "n" } },
            { "m",      mode = { "n" } },
        },
        plugins = {
            marks = false,
            registers = true,
        },
        win = {
            width = 0.95,
            height = { min = 4, max = 12 },
            border = "rounded",
            wo = {
                winblend = 0,
            }
        },
    }
}
