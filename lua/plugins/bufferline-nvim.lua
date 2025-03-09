-- buffer tabs
-- https://github.com/akinsho/bufferline.nvim
return {
    'akinsho/bufferline.nvim',
    dependencies = {
        'kyazdani42/nvim-web-devicons'
    },
    event = 'VeryLazy',
    opts = {
        options = {
            -- mode = 'tabs', -- enable to show tabpages mode
            offsets = { { filetype = "NvimTree", text = "NvimTree", text_align = "left" } },
            show_buffer_close_icons = false,
            show_close_icon = false,
            -- sort by buffer's first window position
            sort_by = function(buffer_a, buffer_b)
                -- find first windows id
                local winid_a = vim.fn.bufwinid(buffer_a.id)
                local winid_b = vim.fn.bufwinid(buffer_b.id)
                -- find win coordinates
                local winpos_a = vim.api.nvim_win_get_position(winid_a)
                local winpos_b = vim.api.nvim_win_get_position(winid_b)
                -- distance score from top left corner
                -- amplifying column index ensuring vertical splits sorted earlier
                local dist_a = winpos_a[1] * winpos_a[2] * 10
                local dist_b = winpos_b[1] * winpos_b[2] * 10
                -- smaller dist go to top
                return dist_a < dist_b
            end,
            -- only show active buffer in the current tabpage on bufferline
            custom_filter = function(cur_buf_num, _)
                local win_buf_ls = vim.fn.tabpagebuflist(vim.fn.tabpagenr())
                for _, buf_num in pairs(win_buf_ls) do
                    if cur_buf_num == buf_num then
                        return true
                    end
                end
                return false
            end,
            -- diagnostics infos
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(_, _, diagnostics_dict, _)
                local s = " "
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " "
                        or (e == "warning" and " " or " ")
                    s = s .. n .. sym
                end
                return s
            end,
            -- click to focus win containing the buffer
            left_mouse_command = function(bufnr)
                local tabnr = vim.fn.tabpagenr()
                local wins = vim.api.nvim_tabpage_list_wins(tabnr)
                local targetWin = vim.fn.bufwinid(bufnr)
                for _, win in ipairs(wins) do
                    if win == targetWin then
                        vim.api.nvim_set_current_win(targetWin)
                        return
                    end
                end
            end
        }
    },
    init = function()
        vim.opt.termguicolors = true
    end,
}
