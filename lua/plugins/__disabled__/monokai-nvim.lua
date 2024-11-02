return {
    'tanvirtin/monokai.nvim',
    enabled = false,
    opts = {
    },
    init = function()
        require('monokai').setup({ palette = require('monokai').ristretto })
        vim.cmd('colorscheme monokai')
    end,
}
