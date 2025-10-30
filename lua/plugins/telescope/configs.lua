local M = {}

local actions = require('telescope.actions')
local layout = require('telescope.actions.layout')
local themes = require('telescope.themes')

M.defaults = {
    layout_strategy = 'vertical',
    layout_config = {
        vertical = {
            width = 0.85,
            preview_height = 0.65,
            preview_cutoff = 20,
        },
    },
    mappings = {
        n = {
            o = actions.toggle_all,
            p = layout.toggle_preview,
            J = actions.cycle_history_next,
            K = actions.cycle_history_prev,
            t = { actions.select_tab, type = 'action', opts = { nowait = true } },
            ['<Tab>'] = actions.select_tab,
            ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_worse,
            ['\\'] = actions.select_vertical,
            ['-'] = actions.select_horizontal,
            ['<M-q>'] = actions.send_to_qflist + actions.open_qflist,
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
        },
        i = {
            ['<Tab>'] = actions.select_tab,
            ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_worse,
            ['<C-j>'] = actions.cycle_history_next,
            ['<C-k>'] = actions.cycle_history_prev,
            ['<Down>'] = actions.cycle_history_next,
            ['<Up>'] = actions.cycle_history_prev,
            ['<M-q>'] = actions.send_to_qflist + actions.open_qflist,
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
        },
    },
    sorting_strategy = 'ascending',
    scroll_strategy = 'limit',
    initial_mode = 'normal',
    border = true,
    dynamic_preview_title = true,
    prompt_prefix = '🔍 ',
    cache_picker = { num_pickers = 50 },
    file_ignore_patterns = {
        '**/__editable__',
    },
}

M.pickers = {
    find_files = { initial_mode = 'insert' },
    live_grep = { initial_mode = 'insert' },
    jumplist = { show_line = false },
    help_tags = { initial_mode = 'insert' },
    buffers = {
        layout_config = { width = 0.7, preview_height = 0.5 },
        mappings = { n = { x = 'delete_buffer' } },
        sort_mru = true,
    },
    current_buffer_fuzzy_find = { initial_mode = 'insert' },
    registers = { initial_mode = 'insert', layout_config = { width = 0.7, height = 0.1 } },
    builtin = { layout_config = { preview_height = 0.4 } },
    vim_options = { initial_mode = 'insert' },
    colorscheme = { layout_config = { width = 0.5, height = 0.7, preview_height = 0.5 } },
    spell_suggest = { layout_config = { width = 0.2, height = 0.7 } },
    command_history = { layout_config = { width = 0.6 } },
    highlights = { layout_config = { width = 0.7 } },
    lsp_definitions = {
        jump_type = 'never',
        fname_width = 60,
        trim_text = true,
        layout_config = { preview_height = 0.73 },
    },
    lsp_references = {
        jump_type = 'never',
        include_current_line = true,
    },
}

M.extensions = {
    fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
    },
    ['ui-select'] = {
        themes.get_cursor({
            border = true,
        }),
    },
    tabman = {
        prompt_title = 'Tabman: find tabpages and windows',
    },
}

return M
