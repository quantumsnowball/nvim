-- AI Chat
-- https://github.com/Robitx/gp.nvim
return {
    'robitx/gp.nvim',
    event = 'VeryLazy',
    -- Config spec:
    -- https://github.com/Robitx/gp.nvim/blob/main/lua/gp/config.lua
    opts = {
        -- chat user prompt prefix
        chat_user_prefix = '💬 >>>',
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
        { '<leader>ai', ':GpChatToggle<cr>G', desc = 'toggle GP chat', mode = { 'n', 'v' } },
        { '<leader>a-', ':GpChatNew split<cr>G', desc = 'create new GP chat in split', mode = { 'n', 'v' } },
        { '<leader>an', ':GpChatNew vsplit<cr>G', desc = 'create new GP chat', mode = { 'n', 'v' } },
        { '<leader>a\\', ':GpChatNew vsplit<cr>G', desc = 'create new GP chat in vsplit', mode = { 'n', 'v' } },
        { '<leader>ap', ':GpChatNew popup<cr>G', desc = 'create new GP chat in popup', mode = { 'n', 'v' } },
        { '<leader>at', ':GpChatNew tabnew<cr>G', desc = 'create new GP chat in tabpage', mode = { 'n', 'v' } },
        -- operate with selection
        { '<leader>aa', ':GpVnew<cr>', desc = 'operate selection using GP to new vsplit', mode = { 'n', 'v' } },
        -- generate response
        { '<leader>ag', ':GpChatRespond<cr>', desc = 'generate GP chat response', mode = { 'n', 'v' } },
        { '<leader>as', ':GpStop<cr>', desc = 'stop generate GP chat response', mode = { 'n', 'v' } },
        -- delete chat
        { '<leader>ad', ':GpChatDelete<cr>', desc = 'delete GP chat', mode = { 'n', 'v' } },
        -- copy / paste text
        { '<leader>ay', ':GpChatPaste vsplit<cr>', desc = 'paste selection to the last GP chat', mode = { 'n', 'v' } },
        -- direct text manipulation
        { '<leader>ae', ':GpImplement<cr>', desc = 'implement selection using GP', mode = { 'n', 'v' } },
        { '<leader>ar', ':GpRewrite<cr>', desc = 'rewrite selection using GP', mode = { 'n', 'v' } },
    },
}
