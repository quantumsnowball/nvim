-- import
local tb = require('telescope.builtin')

-- helpers
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


-- lsp related keymaps
return {
    -- service
    { '<leader>lr', '<cmd>LspRestart<cr>',   desc = 'LSP restart' },
    { '<leader>ll', '<cmd>LspLog<cr>',       desc = 'LSP log' },
    { '<leader>li', '<cmd>LspInfo<cr>',      desc = 'LSP info' },
    -- editing
    { '<leader>r',  vim.lsp.buf.rename,      desc = 'LSP rename' },
    -- { ';f',         vim.lsp.buf.format,      desc = 'LSP format code' },
    { 'qf',         vim.lsp.buf.code_action, desc = 'LSP code action' },
    -- code inspect
    { 'gr',         tb.lsp_references,       desc = 'LSP references' },
    { 'gD',         vim.lsp.buf.declaration, desc = 'LSP declaration' },
    { 'gd',         tb.lsp_definitions,      desc = 'LSP definitions' },
    { 'K',          hover,                   desc = 'LSP hover' },
    { 'gi',         tb.lsp_implementations,  desc = 'LSP implementation' },
    { '<leader>k',  signature_help,          desc = 'LSP signature help' },
    { '<C-k>',      signature_help,          desc = 'LSP signature help', mode = 'i' },
    { '<space>D',   tb.lsp_type_definitions, desc = 'LSP type definitions' },
    { ']e',         next_diagnostic,         desc = 'LSP next diagnostic' },
    { '[e',         prev_diagnostic,         desc = 'LSP previous diagnostic' },
}
