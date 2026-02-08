-- opencode
-- https://github.com/nickjvandyke/opencode.nvim
return {
    'nickjvandyke/opencode.nvim',
    dependencies = {
        -- Recommended for `ask()` and `select()`.
        -- Required for `snacks` provider.
        ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
        { 'folke/snacks.nvim', opts = { input = {}, picker = {}, terminal = {} } },
    },
    init = function()
        ---@type opencode.Opts
        vim.g.opencode_opts = {
            -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
        }

        -- Required for `opts.events.reload`.
        vim.o.autoread = true

        -- BUG:
        vim.api.nvim_create_autocmd('VimLeavePre', {
            callback = function() vim.fn.jobstart({ 'pkill', '-f', 'opencode' }, { detach = true }) end,
        })
    end,
    keys = {
        {
            '<leader>ai',
            function() require('opencode').toggle() end,
            desc = 'toggle opencode',
            mode = { 'n', 't' },
        },
        {
            '<leader>aa',
            function() require('opencode').ask('@this: ', { submit = true }) end,
            desc = 'Ask opencode…',
            mode = { 'n', 'x' },
        },
        {
            '<leader>ax',
            function() require('opencode').select() end,
            desc = 'execute opencode action...',
            mode = { 'n', 'x' },
        },
    },
}
