-- lualine
-- https://github.com/nvim-lualine/lualine.nvim
return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        { 'kyazdani42/nvim-web-devicons', opt = true },
        'nvim-lua/lsp-status.nvim'
    },
    event = 'VeryLazy',
    opts = function()
        local opts = {
            options = {
                -- Gallery
                -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
                theme = 'powerline_dark',
                disabled_filetypes = { 'packer', 'NvimTree', 'Outline' },
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                globalstatus = true,
            },
            sections = {
                lualine_a = {
                    'mode',
                    'selectioncount',
                },
                lualine_b = {
                    'branch',
                    'diff',
                },
                lualine_c = {
                    { 'filename',    path = 1 },
                    { 'searchcount', color = 'Search' },
                },
                lualine_x = {
                    'diagnostics',
                },
                lualine_y = {
                    'lsp_status',
                    'filetype',
                },
                lualine_z = {
                    'location',
                },
            },
            inactive_sections = {
                lualine_c = { { 'filename', path = 1 } }
            }
        }

        if os.getenv("TERMUX_VERSION") then
            opts.options.component_separators = { left = '|', right = '|' }
            opts.options.section_separators = { left = '', right = '' }
        end

        return opts
    end,
    init = function()
        -- disable the original mode indicator
        vim.opt.showmode = false
    end
}
