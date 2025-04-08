-- lsp  related keymaps

local hover = function()
    vim.lsp.buf.hover({ border = 'rounded' })
end
local signature_help = function()
    vim.lsp.buf.signature_help({ border = 'rounded' })
end
local next_diagnostic = function()
    vim.diagnostic.jump({ count = 1, float = true })
end
local prev_diagnostic = function()
    vim.diagnostic.jump({ count = -1, float = true })
end

return {
    -- service
    { '<leader>lr', '<cmd>LspRestart<cr>',                    desc = 'LSP restart' },
    { '<leader>ll', '<cmd>LspLog<cr>',                        desc = 'LSP log' },
    { '<leader>li', '<cmd>LspInfo<cr>',                       desc = 'LSP info' },
    -- editing
    { '<leader>r',  vim.lsp.buf.rename,                       desc = 'lsp.buf.rename()' },
    { ';f',         vim.lsp.buf.format,                       desc = 'lsp.buf.format()' },
    { 'qf',         vim.lsp.buf.code_action,                  desc = 'lsp.buf.code_action()' },
    -- code inspect
    { 'gr',         '<cmd>Telescope lsp_references<cr>',      desc = 'lsp.buf.references()' },
    { 'gD',         vim.lsp.buf.declaration,                  desc = 'lsp.buf.declaration()' },
    { 'gd',         '<cmd>Telescope lsp_definitions<cr>',     desc = 'lsp.buf.definition()' },
    { 'K',          hover,                                    desc = 'lsp.buf.hover()' },
    { 'gi',         '<cmd>Telescope lsp_implementations<cr>', desc = 'lsp.buf.implementation()' },
    { '<leader>k',  signature_help,                           desc = 'lsp.buf.signature_help()' },
    { '<C-k>',      signature_help,                           desc = 'lsp.buf.signature_help()', mode = 'i' },
    { '<space>D',   vim.lsp.buf.type_definition,              desc = 'lsp.buf.type_definition()' },
    { ']e',         next_diagnostic,                          desc = 'lsp.diagnostic.next()' },
    { '[e',         prev_diagnostic,                          desc = 'lsp.diagnostic.prev()' },
}
