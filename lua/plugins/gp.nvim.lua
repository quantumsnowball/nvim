-- AI Chat
-- https://github.com/Robitx/gp.nvim
return {
    'robitx/gp.nvim',
    event = 'VeryLazy',
    -- Config spec:
    -- https://github.com/Robitx/gp.nvim/blob/main/lua/gp/config.lua
    opts = {
        -- For customization, refer to Install > Configuration in the Documentation/Readme
        providers = {
            openai = {
                -- disable the default openai
                disable = true,
            },
            googleai = {
                -- enable this
                disable = false,
                -- see https://ai.google.dev/gemini-api/docs/quickstart#rest for the correct REST api url
                -- see https://ai.google.dev/api for different version endpoint available
                endpoint = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:streamGenerateContent?key={{secret}}',
                -- create .gemini file, with one line `export GEMINI_API_KEY="<your-key>"`
                -- source this file inside the
                secret = os.getenv('GEMINI_API_KEY'),
            },
        },
        -- optional curl parameters (for proxy, etc.)
        curl_params = {
            '--proxy',
            os.getenv('HTTP_PROXY'),
        },
    },
    keys = {
        -- open chat / new chat
        { '<leader>ai', '<cmd>GpChatToggle<cr>G', desc = 'toggle GP chat' },
        { '<leader>a-', '<cmd>GpChatNew split<cr>G', desc = 'create new GP chat in split' },
        { '<leader>an', '<cmd>GpChatNew vsplit<cr>G', desc = 'create new GP chat' },
        { '<leader>a\\', '<cmd>GpChatNew vsplit<cr>G', desc = 'create new GP chat in vsplit' },
        { '<leader>ap', '<cmd>GpChatNew popup<cr>G', desc = 'create new GP chat in popup' },
        { '<leader>at', '<cmd>GpChatNew tabnew<cr>G', desc = 'create new GP chat in tabpage' },
        -- generate response
        { '<leader>ag', '<cmd>GpChatRespond<cr>', desc = 'generate GP chat response' },
        { '<leader>as', '<cmd>GpStop<cr>', desc = 'stop generate GP chat response' },
        -- delete chat
        { '<leader>ad', '<cmd>GpChatDelete<cr>', desc = 'delete GP chat' },
        -- copy / paste text
        { '<leader>ay', ':GpChatPaste<cr>', desc = 'paste selection to the last GP chat', mode = 'v' },
        -- direct text manipulation
        { '<leader>ar', ':GpImplement<cr>', desc = 'implement selection using GP', mode = 'v' },
        { '<leader>aa', ':GpAppend<cr>', desc = 'append GP result after current line', mode = { 'n', 'v' } },
    },
}
