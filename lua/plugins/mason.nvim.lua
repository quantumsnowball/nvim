-- cmdline tools and lsp servers
-- https://github.com/williamboman/mason.nvim
return {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    keys = {
        { '<leader>M', '<cmd>Mason<cr>', desc = 'Mason' },
    },
    opts = {
        ui = {
            border = 'rounded',
        },
    },
}
