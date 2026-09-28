-- disable hard wrapping
vim.opt_local.textwidth = 0

-- set split height to 30% of the overall Neovim window height
local target_height = math.floor(vim.o.lines * 0.3)
if target_height > 0 then
    vim.api.nvim_win_set_height(0, target_height)
end
