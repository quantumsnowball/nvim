-- search/replace in multiple files
-- https://github.com/nvim-pack/nvim-spectre
return {
    'windwp/nvim-spectre',
    event = 'VeryLazy',
    opts = {
        mapping = {
            ['run_current_replace'] = {
                map = 'qr',
                cmd = "<cmd>lua require('spectre.actions').run_current_replace()<cr>",
                desc = 'replace current item',
            },
        },
    },
    init = function()
        local map = require('utils').map
        -- open_visual is delayed by one if setting up using keys props
        -- temp fix: setup keymaps using vim cmd
        --
        -- step: open, pull to far bottom, enter insert
        map(
            'n',
            '<leader>sr',
            ":lua require('spectre').open()<cr><c-w>Ji",
            { noremap = true, desc = 'spectre: search and replace, bottom window' }
        )
        -- step: open, pull to far right, enter insert
        map(
            'n',
            '<leader>SR',
            ":lua require('spectre').open()<cr><c-w>Li",
            { noremap = true, desc = 'spectre: search and replace, right window' }
        )
        -- step: copy, restore selection, open_visual, pull to far bottom, enter insert, paste from " register
        map(
            'v',
            '<leader>sr',
            "ygv<esc>:lua require('spectre').open_visual()<cr><c-w>Jjji<c-r>\"",
            { noremap = true, desc = 'spectre: search and replace selected text, bottom window' }
        )
        -- step: copy, restore selection, open_visual, pull to far right, enter insert, paste from " register
        map(
            'v',
            '<leader>SR',
            "ygv<esc>:lua require('spectre').open_visual()<cr><c-w>Ljji<c-r>\"",
            { noremap = true, desc = 'spectre: search and replace selected text, right window' }
        )
    end,
}
