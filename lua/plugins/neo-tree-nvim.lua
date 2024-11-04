-- neo-tree
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            's1n7ax/nvim-window-picker'
        },
        event = 'VeryLazy',
        keys = {
            -- float
            { '<leader>e',  '<cmd>Neotree reveal float toggle<cr>',     desc = 'Neotree Floating' },
            { '<space>e',   '<cmd>Neotree reveal float toggle<cr>',     desc = 'Neotree Floating' },
            { 'qq',         '<cmd>Neotree reveal float toggle<cr>',     desc = 'Neotree Floating' },
            { 'qe',         '<cmd>Neotree reveal float toggle<cr>',     desc = 'Neotree Floating' },
            -- left
            { '<leader>EH', '<cmd>Neotree reveal left toggle<cr>',      desc = 'Neotree Left' },
            { '<space>EH',  '<cmd>Neotree reveal left toggle<cr>',      desc = 'Neotree Left' },
            -- right
            { '<leader>EL', '<cmd>Neotree reveal right toggle<cr>',     desc = 'Neotree Right' },
            { '<space>EL',  '<cmd>Neotree reveal right toggle<cr>',     desc = 'Neotree Right' },
            -- top
            { '<leader>EK', '<cmd>Neotree reveal top toggle<cr>',       desc = 'Neotree Top' },
            { '<space>EK',  '<cmd>Neotree reveal top toggle<cr>',       desc = 'Neotree Top' },
            -- bottom
            { '<leader>EJ', '<cmd>Neotree reveal bottom toggle<cr>',    desc = 'Neotree Bottom' },
            { '<space>EJ',  '<cmd>Neotree reveal bottom toggle<cr>',    desc = 'Neotree Bottom' },
            -- git
            { '<leader>EG', '<cmd>Neotree git_status float toggle<cr>', desc = 'Neotree Git Status' },
            { '<space>EG',  '<cmd>Neotree git_status float toggle<cr>', desc = 'Neotree Git Status' },
        },
        opts = {
            sources = {
                'filesystem',
                'git_status',
                -- "buffers",
            },
            popup_border_style = 'rounded',
            default_component_configs = {
                name = {
                    trailing_slash = true,
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added    = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                    }
                }
            },
            window = {
                mappings = {
                    ['<esc>'] = 'close_window',
                    ['o'] = 'toggle_node',
                    ['e'] = 'toggle_node',
                    ['<right>'] = 'open',
                    ['<left>'] = 'close_node',
                    ["<bs>"] = 'close_node',
                    ['E'] = 'expand_all_nodes',
                    ['g-'] = 'split_with_window_picker',
                    ['<c-x>'] = 'split_with_window_picker',
                    ['g\\'] = 'vsplit_with_window_picker',
                    ['<c-v>'] = 'vsplit_with_window_picker',
                    ['<c-t>'] = 'open_tabnew',
                    ["<tab>"] = "next_source",
                    -- disable
                    ['s'] = '',
                    ['S'] = '',
                    ['l'] = '',
                    ['.'] = '',
                }
            },
            git_status = {
                window = {
                    position = "float",
                    mappings = {
                        ["A"]       = "git_add_all",
                        ["<space>"] = "git_add_file",
                        ["s"]       = "git_add_file",
                        ["S"]       = "git_unstage_file",
                        ["gr"]      = "git_revert_file",
                        ["c"]       = "git_commit",
                        ["P"]       = "git_push",
                        ["CP"]      = "git_commit_and_push",
                    }
                }
            },
            source_selector = {
                winbar = true,
            }
        }
    },
    {
        's1n7ax/nvim-window-picker',
        -- tag = 'v1.*',
        lazy = true,
        opts = {
            autoselect_one = true,
            include_current = false,
            selection_chars = '123456789ABCDEF',
            use_winbar = 'always',
            filter_rules = {
                -- filter using buffer options
                bo = {
                    -- if the file type is one of following, the window will be ignored
                    filetype = { 'neo-tree', "neo-tree-popup", "notify" },

                    -- if the buffer type is one of following, the window will be ignored
                    buftype = { 'terminal', "quickfix", "nofile" },
                },
            },
            -- other_win_hl_color = '#e35e4f',
        }
    }
}
