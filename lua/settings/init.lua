-- global leader key
vim.g.mapleader = ','

-- copy and paste to system clipboard
vim.cmd('set clipboard^=unnamed,unnamedplus')

-- keymaps and hints
require('settings.general')
require('settings.colorscheme')
require('settings.clipboard')
require('settings.editing')
require('settings.configs')
require('settings.tabbar')
require('settings.window')
require('settings.testing')
require('settings.commands')
