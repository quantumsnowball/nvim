-- telescope
-- https://github.com/nvim-telescope/telescope.nvim
return {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = 'VeryLazy',
    opts = require('plugins.telescope.configs'),
    init = function()
        -- telescope keymaps
        require('plugins.telescope.keymaps')
    end
}
