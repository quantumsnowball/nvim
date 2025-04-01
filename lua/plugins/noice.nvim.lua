-- better messaging system UI
-- https://github.com/folke/noice.nvim
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        -- for displaying popup and text input UI
        -- https://github.com/MunifTanjim/nui.nvim
        "MunifTanjim/nui.nvim",
    },
    keys = {
        -- just show me all messages possible
        { "<leader>m", ':Noice all<cr>', desc = 'Show all message capture by Noice' }
    },
    -- default opts:
    -- https://github.com/folke/noice.nvim/blob/main/lua/noice/config/init.lua
    opts = {
        -- This replace the bottom cmdline with a center popup input
        cmdline = {
            enabled = true,
            -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
            view = "cmdline_popup",
        },
        -- lsp related
        lsp = {
            -- I have my own config for lsp hover and signature
            hover = { enabled = false, },
            signature = { enabled = true, },
        },
        -- message contnrol
        messages = {
            -- I don't use nvim.notify at all as it slows
            enabled = true,
            view = "mini",
            view_error = "mini",
            view_warn = "mini",
            view_history = "messages",
            view_search = false,
        },
        -- options for the message history that you get with `:Noice`
        commands = {
            -- maybe I just use this one cmd, I will search in it to get all I want
            all = {
                -- config the layout in `views` table below
                view = "popup",
                filter_opts = { reverse = true },
            }
        },
        -- default views configs:
        -- https://github.com/folke/noice.nvim/blob/main/lua/noice/config/views.lua
        views = {
            -- popup powered by nui.nvim, its configs:
            -- https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
            popup = {
                position = "50%",
                size = {
                    width = "auto",
                    height = "auto",
                    min_height = 5,
                },
                border = {
                    padding = {
                        1, -- top/bottom
                        2, -- left/right
                    },
                    text = {
                        top = " Noice ",
                    },
                },
                close = {
                    keys = { '<esc>', 'q' },
                },
            },
            -- auto disappearing popup at bottom right corner, fast and lightweight
            mini = {
                timeout = 7000,
                position = {
                    row = -2,
                },
                border = {
                    style = 'none',
                    padding = { left = 0, right = 3, },
                },
                size = {
                    max_height = 20,
                },
                win_options = {
                    winhighlight = {
                        FloatBorder = "SpecialComment"
                    },
                },
            }
        },
    },
}
