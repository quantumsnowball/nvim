-- nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua
return {
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly',
    enabled = false,
    dependencies = 'kyazdani42/nvim-web-devicons',
    keys = {
        { '<leader>E', '<cmd>NvimTreeToggle .<cr>', desc = 'NvimTreeToggle' },
    },
    init = function()
        require('nvim-tree').setup {
            actions = {
                change_dir = {
                    enable = false,
                },
            },
            reload_on_bufenter = true,
            update_focused_file = {
                enable = true,
            },
            view = {
                float = {
                    enable = true,
                    open_win_config = {
                        relative = 'win',
                        height = 1000,
                    }
                },
                adaptive_size = true,
                mappings = {
                    list = {
                        { key = "<esc>", action = "close" }
                    }
                }
            },
            renderer = { highlight_opened_files = 'all' },
            -- default hide dotfiles and ignored files
            -- simply type H I to toggle show
            filters = { dotfiles = true },
            git = { ignore = true }
        }
    end
}
