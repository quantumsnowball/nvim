-- search/replace in multiple files
-- https://github.com/nvim-pack/nvim-spectre
return {
    "windwp/nvim-spectre",
    event = 'VeryLazy',
    opts = {
        mapping = {
            ['run_current_replace'] = {
                map = "qr",
                cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
                desc = "replace current item"
            }
        }
    },
    init = function()
        -- open_visual is delayed by one if setting up using keys props
        -- temp fix: setup keymaps using vim cmd
        --
        -- step: open, pull to far bottom, enter insert
        vim.cmd "nnoremap <silent> <leader>sr :lua require('spectre').open()<CR><c-w>Ji"
        -- step: copy, restore selection, open_visual, pull to far right, enter insert, paste from " register
        vim.cmd "nnoremap <silent> <leader>SR :lua require('spectre').open()<CR><c-w>Li"
        -- step: copy, restore selection, open_visual, pull to far bottom, enter insert, paste from " register
        vim.cmd "vnoremap <silent> <leader>sr ygv<esc>:lua require('spectre').open_visual()<CR><c-w>Jjji<c-r>\""
        -- step: copy, restore selection, open_visual, pull to far right, enter insert, paste from " register
        vim.cmd "vnoremap <silent> <leader>SR ygv<esc>:lua require('spectre').open_visual()<CR><c-w>Ljji<c-r>\""
    end
}
