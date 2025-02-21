-- pop up for keymap hints
-- https://github.com/folke/which-key.nvim
return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        preset = "modern", -- classic, modern, and helix
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
            height = { min = 4, max = 10 },
            border = "double",
            wo = {
                winblend = 20,
            }
        },
    }
}
