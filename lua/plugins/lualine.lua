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
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = {
                    -- {
                    --     require("noice").api.status.message.get_hl,
                    --     cond = require("noice").api.status.message.has,
                    -- },
                    {
                        require("noice").api.status.mode.get,
                        cond = require("noice").api.status.mode.has,
                        color = { fg = "#ff9e64" },
                    },
                    {
                        require("noice").api.status.search.get,
                        cond = require("noice").api.status.search.has,
                        color = { fg = "#ff9e64" },
                    },
                    {
                        require("noice").api.status.command.get,
                        cond = require("noice").api.status.command.has,
                        color = { fg = "#ff9e64" },
                    }
                },
                lualine_y = {
                    'lsp_status',
                    function() return require('lsp-status').status() end,
                    'filetype',
                    'encoding',
                    'fileformat',
                },
                lualine_z = {
                    'location',
                    'progress',
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
