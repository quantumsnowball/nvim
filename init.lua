-- bootstrap lazy load
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- as required by many plugins, should load before all plugins
vim.opt.termguicolors = true

-- global leader key
vim.g.mapleader = ','

-- Setup lazy.nvim
require('lazy').setup({
    -- ref:
    -- https://github.com/folke/lazy.nvim/blob/main/lua/lazy/core/config.lua
    spec = {
        -- import your plugins
        { import = 'plugins' },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = {
        colorscheme = { 'habamax' },
    },
    -- automatically check for plugin updates
    checker = {
        enabled = true,
        notify = true,
    },
})

-- other nvim settings
require('settings')
