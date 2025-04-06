local tb = require('telescope.builtin')
local map = require('utils').map

--
-- most common
-- should be as handy as possible, and not sharing a prefix with other combos
--
-- find files
map('n', '<leader>f', function() tb.find_files({ hidden = true }) end, { desc = 'telescope.find_files()' })
map('n', '<space>f', function() tb.find_files({ hidden = true }) end, { desc = 'telescope.find_files()' })
-- find words
map('n', '<leader>w', function() tb.live_grep({ additional_args = function() return { "--hidden" } end }) end,
    { desc = 'telescope.live_grep()' })
map('n', '<space>w', function() tb.live_grep({ additional_args = function() return { "--hidden" } end }) end,
    { desc = 'telescope.live_grep()' })
-- find recent files
map('n', '<leader>R', function() tb.oldfiles({ only_cwd = true }) end, { desc = 'telescope.oldfiles()' })
map('n', '<space>R', function() tb.oldfiles({ only_cwd = true }) end, { desc = 'telescope.oldfiles()' })
-- find buffers
map('n', '<leader>b', tb.buffers, { desc = 'telescope.buffers()' })
map('n', '<space>b', tb.buffers, { desc = 'telescope.buffers()' })
map('n', '<leader>B', function() tb.buffers({ initial_mode = 'insert' }) end, { desc = 'telescope.buffers()' })
map('n', '<space>B', function() tb.buffers({ initial_mode = 'insert' }) end, { desc = 'telescope.buffers()' })
-- fzf current buffer
map('n', '<leader>z', tb.current_buffer_fuzzy_find, { desc = 'telescope.current_buffer_fuzzy_find()' })
map('n', '<space>z', tb.current_buffer_fuzzy_find, { desc = 'telescope.current_buffer_fuzzy_find()' })
-- find helps
map('n', '<leader>H', tb.help_tags, { desc = 'telescope.help_tags()' })
map('n', '<space>H', tb.help_tags, { desc = 'telescope.help_tags()' })
-- find keymaps
map('n', '<leader>K', function() tb.keymaps({ initial_mode = 'insert' }) end, { desc = 'telescope.keymaps()' })
map('n', '<space>K', function() tb.keymaps({ initial_mode = 'insert' }) end, { desc = 'telescope.keymaps()' })
-- find dictionary
map('n', '<leader>ss', tb.spell_suggest, { desc = 'telescope.spell_suggest()' })
map('n', '<space>ss', tb.spell_suggest, { desc = 'telescope.spell_suggest()' })
-- lsp
map('n', '<leader>v', tb.lsp_references, { desc = 'telescope.lsp_references()' })
map('n', '<space>v', tb.lsp_references, { desc = 'telescope.lsp_references()' })
map('n', 'gd', tb.lsp_definitions, { desc = 'telescope.lsp_definitions()' })



--
-- less common pickers
-- propose to start with ,F to give way to fastest ,f
--
-- general operation
map('n', '<leader>F.', tb.resume, { desc = 'telescope.resume()' })
map('n', '<leader>F/', tb.pickers, { desc = 'telescope.pickers()' })

-- find files
map('n', '<leader>Fnf', tb.find_files, { desc = 'telescope.find_files(--no-hidden)' })
map('n', '<leader>Faf', function() tb.find_files({ hidden = true, no_ignore = true }) end,
    { desc = 'telescope.find_files(--everything)' })

-- find words
map('n', '<leader>Fnw', tb.live_grep, { desc = 'telescope.live_grep(--no-hidden)' })
map('n', '<leader>Faw', function()
    tb.live_grep({ additional_args = function() return { "--hidden", "--no-ignore" } end })
end, { desc = 'telescope.live_grep(--everything)' })

-- find tabpages
-- map('n', 'T', tb.tabpages, { desc = 'telescope.tabpages()'})

-- registers
map('n', "<leader>F'", tb.registers, { desc = 'telescope.registers()' })
map('n', "<space>F'", tb.registers, { desc = 'telescope.registers()' })

-- find jumplist
map('n', '<leader>Fj', tb.jumplist, { desc = 'telescope.jumplist()' })

-- grep visual selected text directly
map('v', '<leader>w', tb.grep_string, { desc = 'telescope.grep_string(--visual-mode)' })

-- color scheme
map('n', '<leader>Fcs', tb.colorscheme, { desc = 'telescope.colorscheme()' })

-- git navigation
map('n', '<leader>gC', tb.git_commits, { desc = 'telescope.git_commits()' })
map('n', '<leader>gb', tb.git_bcommits, { desc = 'telescope.git_bcommits() [% git blames]' })
map('n', '<leader>gd', tb.git_status, { desc = 'telescope.git_status()' })

-- vim commands
map('n', '<leader>F;', tb.command_history, { desc = 'telescope.command_history()' })
map('n', '<leader>Fch', tb.command_history, { desc = 'telescope.command_history()' })
map('n', '<leader>Fcc', tb.commands, { desc = 'telescope.command_custom()' })

-- vim autocmds
map('n', '<leader>Fac', tb.autocommands, { desc = 'telescope.autocommand()' })

-- lsp
map('n', '<leader>Fe', tb.diagnostics, { desc = 'telescope.diagnostics()' })
map('n', '<leader>Fca', vim.lsp.buf.code_action, { desc = 'telescope.code_action()' })

-- highlights
map('n', '<leader>Fi', tb.highlights, { desc = 'telescope.highlights()' })

-- treesitter objects
map('n', '<leader>Fto', tb.treesitter, { desc = 'telescope.treesitter()' })

-- marks
map('n', '<leader>Fm', tb.marks, { desc = 'telescope.marks()' })

-- list all telescop.builtin functions
map('n', '<leader>Fp', tb.builtin, { desc = 'telescope.builtin()' })

-- list vim options
map('n', '<leader>Fo', tb.vim_options, { desc = 'telescope.vim_options()' })
