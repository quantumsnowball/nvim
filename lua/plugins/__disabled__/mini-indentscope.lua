-- active indent guide and indent text objects
-- https://github.com/echasnovski/mini.indentscope
return {
    'echasnovski/mini.indentscope',
    enabled = false,
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = 'BufReadPre',
    opts = {
        -- symbol = "▏",
        symbol = '│',
        options = { try_as_border = true },
    },
    init = function(_, opts)
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'vimdoc', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason', 'NvimTree' },
            callback = function() vim.b.miniindentscope_disable = true end,
        })
        require('mini.indentscope').setup(opts)
    end,
}
