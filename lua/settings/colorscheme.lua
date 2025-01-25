-- default theme
vim.cmd('colorscheme FourSeasons-Winter')

-- module
local M = {}

M.setup = function(palette)
    local groups = {
        String = { fg = palette.red, bg = palette.base2, },
    }
    -- set hl groups
    local str = 'string'
    for name, val in pairs(groups) do
        print(name)
        print(val)
        vim.api.nvim_set_hl(0, name, val)
    end
end

return M
