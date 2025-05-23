-- show buffer path at top right corner
-- https://github.com/b0o/incline.nvim
return {
    'b0o/incline.nvim',
    lazy = true,
    init = function()
        -- define its own highligh group
        vim.cmd([[ autocmd VimEnter,ColorScheme * hi InclineActive guifg=#deff00 guibg=#555555 gui=bold ]])
        vim.cmd([[ autocmd VimEnter,ColorScheme * hi InclineInactive guifg=#deff00 guibg=#444444 ]])
        -- config
        require('incline').setup({
            hide = {
                cursorline = 'focused_win',
            },
            highlight = {
                groups = {
                    InclineNormal = {
                        default = true,
                        group = 'InclineActive',
                    },
                    InclineNormalNC = {
                        default = true,
                        group = 'InclineInactive',
                    },
                },
            },
            -- output formatting function
            render = function(props)
                -- reference :help filename-modifiers
                local path = vim.api.nvim_buf_get_name(props.buf)
                local cwd = vim.fn.getcwd()
                -- full path relative to cwd
                return string.sub(path, #cwd + 2)
            end,
        })
    end,
}
