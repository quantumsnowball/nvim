-- set initial state for normal mode when opening a markdown file
vim.opt_local.cursorcolumn = false

-- toggle cursorcolumn based on current mode
vim.api.nvim_create_autocmd("ModeChanged", {
    buffer = 0, -- target current buffer only
    callback = function()
        local mode = vim.api.nvim_get_mode().mode

        -- mode "i" covers insert mode, "ic" covers completion mode
        if mode == "i" or mode == "ic" then
            vim.opt_local.cursorcolumn = true
        else
            vim.opt_local.cursorcolumn = false
        end
    end,
})
