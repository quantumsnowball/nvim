-- ref: https://github.com/swaits/scratch.nvim/blob/main/lua/scratch/init.lua

local map = require('utils').map

---@param vertical boolean|nil Whether to split vertically (default: false)
function open_scratch(vertical)
    -- 1. Capture the filetype of the current (original) buffer
    local original_ft = vim.bo.filetype

    -- 2. Open a vertical split on the right
    local split_cmd = vertical and 'rightbelow vnew' or 'rightbelow new'
    vim.cmd(split_cmd)

    -- 3. Set buffer-local options for the new buffer
    local buf = vim.api.nvim_get_current_buf()
    -- 'nofile' makes it a scratch buffer (no file on disk)
    vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    -- 'wipe' deletes the buffer from memory when you close the window
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'hide')
    -- Disable swap files for this temporary buffer
    vim.api.nvim_buf_set_option(buf, 'swapfile', false)
    -- include the buffer in the buffer list
    vim.api.nvim_buf_set_option(buf, 'buflisted', true)

    -- 4. Apply the original filetype to the new buffer
    if original_ft ~= '' then
        --
        vim.api.nvim_set_option_value('filetype', original_ft, { buf = buf })
        vim.cmd('filetype detect')
    end
end

map('n', '<space>\\', function() open_scratch(true) end, { desc = 'new vertical scratch buffer' })
map('n', '<space>-', function() open_scratch(false) end, { desc = 'new horizontal scratch buffer' })
