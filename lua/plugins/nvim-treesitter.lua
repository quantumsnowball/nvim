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
            -- enable the languages here
            pattern = {
                'python',
            },
            callback = function()
                local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
                if lang then vim.treesitter.start() end
            end,
        })
    end,
}
