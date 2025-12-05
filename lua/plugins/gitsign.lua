-- show git changes
-- https://github.com/lewis6991/gitsigns.nvim
return {
    'lewis6991/gitsigns.nvim',
    event = 'VimEnter',
    opts = {},
    init = function()
        -- show line number
        vim.opt.number = true
        -- always include sign column to fix gutter width
        vim.opt.signcolumn = 'yes'
        -- highlight current line and column
        vim.opt.cursorline = true
        vim.opt.cursorcolumn = true
        -- TODO: #bug
        -- Gitsigns doesn't always refresh after stage or commit
        -- force reset_base every BufEnter event may be a temp solution
        -- vim.api.nvim_create_autocmd("BufEnter", {
        --     pattern = "*",
        --     callback = function()
        --         local success, gitsigns = pcall(require, 'gitsigns')
        --         if success then
        --             gitsigns.reset_base()
        --             -- print(':Gitsigns reset_base')
        --         end
        --     end,
        -- })
        -- debug logging
        -- vim.api.nvim_create_autocmd('User', {
        --     pattern = { 'GitSignsUpdate', 'GitSignsChanged' },
        --     callback = function(args)
        --         print(os.date(), ':', vim.inspect(args))
        --     end
        -- })

        -- keymaps
        local map = require('utils').map

        -- Navigation
        map('n', ']c', '<cmd>Gitsigns next_hunk<cr>')
        map('n', '[c', '<cmd>Gitsigns prev_hunk<cr>')

        -- Actions
        map('n', ';hs', '<cmd>Gitsigns stage_hunk<cr>')
        map('v', ';hs', '<cmd>Gitsigns stage_hunk<cr>')
        map('n', ';hr', '<cmd>Gitsigns reset_hunk<cr>')
        map('v', ';hr', '<cmd>Gitsigns reset_hunk<cr>')
        map('n', ';hS', '<cmd>Gitsigns stage_buffer<cr>')
        map('n', ';hu', '<cmd>Gitsigns undo_stage_hunk<cr>')
        map('n', ';hz', '<cmd>Gitsigns undo_stage_hunk<cr>')
        map('n', ';hR', '<cmd>Gitsigns reset_buffer<cr>')
        map('n', ';hp', '<cmd>Gitsigns preview_hunk<cr>')
        map('n', ';gb', '<cmd>lua require"gitsigns".blame_line{full=true}<cr>')
        map('n', ';gB', '<cmd>Gitsigns toggle_current_line_blame<cr>')
        map('n', ';gd', '<cmd>Gitsigns diffthis<cr>')
        map('n', ';gD', '<cmd>lua require"gitsigns".diffthis("~")<cr>')
        map('n', ';gx', '<cmd>Gitsigns toggle_deleted<cr>')

        -- Text object
        map('o', 'ih', '<cmd><C-U>Gitsigns select_hunk<cr>')
        map('x', 'ih', '<cmd><C-U>Gitsigns select_hunk<cr>')
    end,
}
