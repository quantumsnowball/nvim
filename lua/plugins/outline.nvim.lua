-- show current file outline using LSP info
-- https://github.com/hedyhli/outline.nvim
-- (this is a fork from the original symbols-outline)
return {
    'hedyhli/outline.nvim',
    lazy = true,
    cmd = { 'Outline', 'OutlineOpen' },
    keys = { -- Example mapping to toggle outline
        { '<leader>o', '<cmd>belowright Outline<cr>', desc = 'Toggle outline' },
        { 'zo', '<cmd>topleft Outline<cr>', desc = 'Toggle outline' },
    },
    opts = {
        outline_window = {
            position = 'left',
            -- Percentage or integer of columns
            width = 25,
            -- (relative_width not working when termianl is resized)
            relative_width = false,
            -- press enter jump to location and close
            auto_close = true,
            -- this will auto scroll the original buffer
            auto_jump = true,
            -- integer milliseconds temporary highlight when jump. better disable for auto jump
            jump_highlight_duration = false,
            -- disable to remain in the oiginal buffer, good for outline view only
            focus_on_open = false,
        },
        preview_window = {
            border = 'rounded',
            -- Percentage or integer of lines
            height = 80,
            relative_height = true,
            width = 60,
            relative_width = true,
            -- use a popup to view the code insteaad of jump
            auto_preview = false,
        },
        symbol_folding = {
            -- Depth past which nodes will be folded by default. Set to false to unfold all on open.
            autofold_depth = 5,
        },
    },
}
