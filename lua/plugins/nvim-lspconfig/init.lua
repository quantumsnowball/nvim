return {
    -- neovim lsp configs
    -- https://github.com/neovim/nvim-lspconfig
    -- https://github.com/williamboman/mason.nvim,
    -- https://github.com/williamboman/mason-lspconfig.nvim,
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
        },
        init = function()
            vim.diagnostic.config({
                float = {
                    border = 'rounded'
                },
                jump = {
                    float = true
                }
            })
        end
    },
    -- cmdline tools and lsp servers
    -- https://github.com/williamboman/mason.nvim
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" } },
        opts = {}
    },
    -- mason-lspconfig
    -- https://github.com/williamboman/mason-lspconfig.nvim
    {
        "williamboman/mason-lspconfig.nvim",
        keys = require('plugins.nvim-lspconfig.keymaps'),
        opts = {
            -- auto install some servers
            -- ensure_installed = {}
        },
        init = function()
            --
            -- lsp server settings
            --
            -- 1. use Mason to install the server
            -- 2. add the correct name to this lise
            -- 3. to provide extra configs, create a module with the exact name and return the table
            -- TODO I can't print any message inside the config(), hard to debug vars. #debug
            local selected = {
                'lua_ls',
                'pyright',
                'ts_ls', -- 'tsserver'
                "cssls",
                "jsonls",
                "html",
            }

            -- activate LSP
            local function activate(lspconfig_name, opts)
                -- lspconfig and mason names are different, mason-lspconfig is the translation
                local translation = require('mason-lspconfig').get_mappings()
                local mason_name = translation.lspconfig_to_mason[lspconfig_name]
                -- ensure server binary is installed before activating it in lspconfig
                if require('mason-registry').is_installed(mason_name) then
                    require("lspconfig")[lspconfig_name].setup(opts or {})
                end
            end
            -- activate desiered server here
            activate('lua_ls')
            activate('pyright')

            -- manually install the selected LSPs
            -- vim.api.nvim_create_user_command('MasonLSPEnsureInstalled', function()
            --     local args = table.concat(selected, " ")
            --     vim.cmd(":LspInstall " .. args)
            -- end, { desc = "Ensure selected LSP tools are installed using Mason" })
        end
    }
}
