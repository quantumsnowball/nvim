local M = {}

-- create keymap with presets
--- @param mode string|string[] Mode(s) for the keymap (e.g., 'n', 'v', {'n', 'v'})
--- @param lhs string Left-hand side of the keymap
--- @param rhs string|function Right-hand side of the keymap (command or function)
--- @param opts? table Optional keymap options
function M.map(mode, lhs, rhs, opts)
    -- defaults
    local defaults = {
        silent = true,
    }
    -- set keymaps
    opts = vim.tbl_extend('force', defaults, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- a debug helper
function M.debug(arg)
    local res = vim.inspect(arg)
    print(res)
end

-- get nearest pytest function name
function M.get_nearest_pytest_function_name(prefix)
    local ts_utils = require('nvim-treesitter.ts_utils')
    local current = ts_utils.get_node_at_cursor()
    -- note: get_node_text 2nd arg must be set to get valid result
    local get_node_text = vim.treesitter.query.get_node_text

    -- loop upward until the top
    while current do
        -- process only function_definition
        if current:type() == 'function_definition' then
            local fnname = get_node_text(current:child(1), 0)
            -- return fnname only when starts with PREFIX
            if string.sub(fnname, 1, 5) == prefix then return fnname end
        end
        current = current:parent()
    end

    print('Pytest function not found: please place cursor inside the scope of a pytest function.')
    return nil
end

return M
