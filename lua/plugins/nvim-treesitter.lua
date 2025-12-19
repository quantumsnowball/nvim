-- syntax highlighting
-- https://github.com/nvim-treesitter/nvim-treesitter
--   requires tree-sitter-cli, can be installed via Mason
return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    event = 'VimEnter',
    build = ':TSUpdate',
    init = function()
        -- for the new nvim-tresitteer at main branch, need to manually enable treesitter
        -- via the build vim.treesitter api, nvim-treesitter no longer handle these
        vim.api.nvim_create_autocmd('FileType', {
            -- here this pattern match all file type, try to start treesitter on everything
            pattern = '*',
            callback = function(ev)
                -- buffer number and type
                local bufnr = ev.buf
                local buftype = vim.bo[bufnr].buftype
                -- empty string means normal buffer, skip all non empty string buftype,
                -- those are non-file buffers (terminals, prompts, floats, etc.)
                if buftype ~= '' then return end
                -- silently attempt to start Treesitter, fails gracefully on any issue
                pcall(vim.treesitter.start, bufnr)
            end,
        })
    end,
}
