-- lsp-status
-- https://github.com/nvim-lua/lsp-status.nvim#configuration
return {
    'nvim-lua/lsp-status.nvim',
    event = 'VeryLazy',
    init = function()
        require('lsp-status').config({
            -- this is temp fix for a wrong line spacing that breaks lualine
            status_symbol = ''
        })
    end
}
