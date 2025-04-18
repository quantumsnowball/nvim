-- better messaging system UI
-- https://github.com/folke/noice.nvim
return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        {
            -- for displaying popup and text input UI
            -- https://github.com/MunifTanjim/nui.nvim
            'MunifTanjim/nui.nvim',
        },
        {
            -- for displaying notification popup
            -- https://github.com/rcarriga/nvim-notify
            'rcarriga/nvim-notify',
            -- nvim-notify opts:
            -- https://github.com/rcarriga/nvim-notify/blob/master/lua/notify/config/init.lua
            opts = {
                top_down = false,
                timeout = 1000,
                stages = 'fade',
                render = 'compact',
                max_width = 80,
                background_colour = '#000000',
            },
        },
    },
    keys = {
        -- just show me all messages possible
        { '<leader>m', '<cmd>Noice all<cr>', desc = 'Show all message capture by Noice' },
    },
    -- default opts:
    -- https://github.com/folke/noice.nvim/blob/main/lua/noice/config/init.lua
    opts = {
        -- This replace the bottom cmdline with a center popup input
        cmdline = {
            enabled = true,
            -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
            view = 'cmdline_popup',
        },
        -- lsp related
        lsp = {
            -- somehow using Noice to display is better looking, e.g. correct escape chars, alignment
            -- also have a vertical scroll bar for longer content
            override = {
                -- override the default lsp markdown formatter with Noice
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                -- override the lsp markdown formatter with Noice
                ['vim.lsp.util.stylize_markdown'] = true,
                -- override cmp documentation with Noice (needs the other options to work)
                ['cmp.entry.get_documentation'] = true,
            },
            hover = {
                enabled = true,
            },
            signature = {
                enabled = true,
            },
        },
        -- message control
        messages = {
            -- everything default to use mini
            enabled = true,
            view = 'mini',
            view_error = 'mini',
            view_warn = 'mini',
            view_history = 'messages',
            view_search = false,
        },
        -- vim.notify
        notify = {
            -- everything default to use mini
            enabled = true,
            view = 'mini',
        },
        presets = {
            -- add a border to hover docs and signature help
            lsp_doc_border = true,
        },
        -- message filter
        routes = {
            -- only selected message use notify
            {
                view = 'notify',
                filter = {
                    event = 'msg_show',
                    kind = {
                        -- git push confirmation
                        'lua_print',
                        -- git commit edit buffer save or discard
                        'echo',
                    },
                },
            },
        },
        -- options for the message history that you get with `:Noice`
        commands = {
            -- maybe I just use this one cmd, I will search in it to get all I want
            all = {
                -- config the layout in `views` table below
                view = 'popup',
                filter_opts = { reverse = true },
            },
        },
        -- default views configs:
        -- https://github.com/folke/noice.nvim/blob/main/lua/noice/config/views.lua
        views = {
            -- popup powered by nui.nvim, its configs:
            -- https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
            popup = {
                position = '50%',
                size = {
                    width = 'auto',
                    height = 'auto',
                },
                border = {
                    padding = {
                        1, -- top/bottom
                        2, -- left/right
                    },
                    text = {
                        top = ' Noice ',
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
                    row = -1,
                },
                border = {
                    style = 'none',
                    padding = { left = 0, right = 3 },
                },
                size = {
                    max_height = 20,
                },
                win_options = {
                    winhighlight = {
                        FloatBorder = 'SpecialComment',
                    },
                },
            },
        },
    },
}
