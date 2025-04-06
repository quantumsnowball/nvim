-- show git changes
-- https://github.com/lewis6991/gitsigns.nvim
return {
    'lewis6991/gitsigns.nvim',
    event = 'VimEnter',
    opts = {
        on_attach = function(bufnr)
            local function map(mode, lhs, rhs, opts)
                opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
                vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
            end

            -- Navigation
            map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
            map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

            -- Actions
            map('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>')
            map('v', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>')
            map('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>')
            map('v', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>')
            map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
            map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
            map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
            map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
            map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
            map('n', '<leader>hB', '<cmd>Gitsigns toggle_current_line_blame<CR>')
            map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
            map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
            map('n', '<leader>hx', '<cmd>Gitsigns toggle_deleted<CR>')

            -- Text object
            map('o', 'ih', '<cmd><C-U>Gitsigns select_hunk<CR>')
            map('x', 'ih', '<cmd><C-U>Gitsigns select_hunk<CR>')
        end
    },
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
    end
}
