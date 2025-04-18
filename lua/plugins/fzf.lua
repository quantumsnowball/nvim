-- fzf
-- https://github.com/junegunn/fzf
return {
    'junegunn/fzf',
    event = 'VeryLazy',
    run = function() vim.fn['fzf#install']() end,
}
