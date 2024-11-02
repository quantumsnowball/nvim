return {
    'quantumsnowball/four-seasons.nvim',
    branch = 'dev',
    -- url = 'git@github.com:quantumsnowball/four-seasons.nvim.git',
    init = function()
        -- theme variants
        local themes = {
            'FourSeasonsSpring',
            'FourSeasonsSummer',
            'FourSeasonsAutumn',
            'FourSeasonsWinter',
        }
        -- default theme
        local id = 4
        vim.cmd('colorscheme ' .. themes[id])
        -- toggle keymap
        require('utils').map('n', '<F3>', function()
            local selected = themes[id]
            print(selected)
            vim.cmd('colorscheme ' .. selected)
            if id >= 4 then
                id = 1
            else
                id = id + 1
            end
        end)
    end,
}
