-- buffer tabs
-- https://github.com/akinsho/bufferline.nvim
return {
    'akinsho/bufferline.nvim',
    dependencies = {
        'kyazdani42/nvim-web-devicons'
    },
    event = 'VeryLazy',
    opts = function()
        local opts = {}

        local jump_to_buffer_window = function(bufnr)
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

        opts.options = {
            offsets = { { filetype = "neo-tree", text = "Neotree", text_align = "left" } },
            show_buffer_close_icons = false,
            show_close_icon = false,
            separator_style = "slant", -- "slant" | "slope" | "thick" | "thin"
            -- sort by buffer's first window position
            sort_by = function(buffer_a, buffer_b)
                -- find first windows id
                local winid_a = vim.fn.bufwinid(buffer_a.id)
                local winid_b = vim.fn.bufwinid(buffer_b.id)
                -- find win coordinates
                local winpos_a = vim.api.nvim_win_get_position(winid_a)
                local winpos_b = vim.api.nvim_win_get_position(winid_b)
                -- sorting
                -- sort horizontally windows first
                if winpos_a[2] < winpos_b[2] then
                    return true
                end
                -- then sort vertical windows
                if winpos_a[2] == winpos_b[2] and winpos_a[1] < winpos_b[1] then
                    return true
                end
                -- otherwise keep the original order
                return false
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
            left_mouse_command = jump_to_buffer_window,
            right_mouse_command = jump_to_buffer_window,
        }

        if os.getenv("TERMUX_VERSION") then
            opts.options.separator_style = "thin"
        end


        local DARK = '#303030'
        local BG_BUF = '#206020'
        local BG_TAB = '#226622'
        local BG_TAB_OTHER = '#22ff44'

        opts.highlights = {
            fill                        = { bg = DARK },
            -- buffer
            separator_visible           = { fg = DARK },
            buffer_selected             = { fg = 'white', bg = BG_BUF },
            separator_selected          = { fg = DARK, bg = BG_BUF, },
            numbers_selected            = { bg = BG_BUF },
            diagnostic_selected         = { bg = BG_BUF },
            hint_selected               = { bg = BG_BUF },
            hint_diagnostic_selected    = { bg = BG_BUF },
            info_selected               = { bg = BG_BUF },
            info_diagnostic_selected    = { bg = BG_BUF },
            warning_selected            = { bg = BG_BUF },
            warning_diagnostic_selected = { bg = BG_BUF },
            error_selected              = { bg = BG_BUF },
            error_diagnostic_selected   = { bg = BG_BUF },
            modified_selected           = { bg = BG_BUF },
            duplicate_selected          = { bg = BG_BUF },
            indicator_selected          = { bg = BG_BUF },
            pick_selected               = { bg = BG_BUF },
            -- tab
            tab                         = { fg = 'white', bg = BG_TAB },
            tab_separator               = { fg = DARK, bg = BG_TAB },
            tab_selected                = { fg = 'black', bg = BG_TAB_OTHER },
            tab_separator_selected      = { fg = DARK, bg = BG_TAB_OTHER },
        }

        return opts
    end,
    init = function()
        vim.opt.termguicolors = true
    end,
}
