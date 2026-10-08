-- global leader key
vim.g.mapleader = ','

-- copy and paste to system clipboard
--   "*, unnamed clipboard: primary selection, highlight text with mouse to copy, middleclick to paste
--   "+, unnamedplus clipboard: main system clipboard, ctrl+c to copy, ctrl+v to paste
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
require('settings.scratch')
