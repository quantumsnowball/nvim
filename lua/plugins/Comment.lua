-- toggle comment line
-- https://github.com/numToStr/Comment.nvim
return {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {},
    init = function()
        -- remap <leader>/ to line comment toggle
        vim.cmd 'nmap <leader>/ gcc'
    end
}
