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
                -- see https://ai.google.dev/gemini-api/docs/quickstart#rest for the correct REST api url format
                endpoint = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key={{secret}}',
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
        { '<leader>ai', '<cmd>GpChatToggle<cr>', desc = 'create GP new chat in vsplit' },
        { '<leader>ai', '<cmd>GpChatToggle<cr>', desc = 'create GP new chat in vsplit' },
    },
}
