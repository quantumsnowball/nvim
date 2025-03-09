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
            mode = 'tabs',
            tab_size = 3,
            offsets = { { filetype = "NvimTree", text = "NvimTree", text_align = "left" } },
            show_buffer_icons = true,
            show_buffer_close_icons = false,
            name_formatter = function(buf)
                return '' .. vim.api.nvim_tabpage_get_number(buf.tabnr)
            end,
        }
    },
    init = function()
        vim.opt.termguicolors = true
    end,
}
