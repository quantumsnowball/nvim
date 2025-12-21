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

        -- BUG: Gitsigns doesn't always refresh after stage or commit
        ---@param caller string
        local function refresh_gitsigns(caller)
            vim.schedule(function()
                -- check if a normal file and buffer is valid
                if vim.bo.buftype == '' and vim.api.nvim_buf_is_valid(0) then
                    -- manually reload the file if autoread failed
                    vim.cmd('silent! checktime')
                    -- then reset base on gitsigns
                    require('gitsigns').reset_base()
                    -- debug message
                    -- print(os.date('%H:%M:%S') .. ': ' .. caller .. ': file reloaded and gitsigns base reset')
                end
            end)
        end
        -- refresh on enter or re-enter any window
        vim.api.nvim_create_autocmd({ 'WinEnter' }, {
            pattern = '*',
            callback = function(args) refresh_gitsigns(args.event) end,
        })
        -- refresh on regular interval: 10s
        vim.uv.new_timer():start(0, 10000, function() refresh_gitsigns('uv.timer') end)

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
