-- display color code on background
-- https://github.com/NvChad/nvim-colorizer.lua
return {
    'NvChad/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
        user_default_options = {
            tailwind = true,
        },
    },
}
