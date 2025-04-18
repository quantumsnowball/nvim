-- fzf telescope extension
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- wiki:
-- 1. Error: failed to run config for telescope-fzf-native.nvim
--    This tool need to build using gcc, clang and make, make sure these are installed
--    If these C tools are not installed during nvim first launch, chance are the build
--    process will fail. Solution is to go to ~/.local/share/nvim/lazy/ and delete the
--    telescope-fzf-native.nvim/ directory. Re launch nvim and start the installation
--    all over again.
--
return {
    'nvim-telescope/telescope-fzf-native.nvim',
    event = 'VeryLazy',
    build = 'make',
    dependencies = 'nvim-telescope/telescope.nvim',
    init = function()
        local tele = require('telescope')
        tele.load_extension('fzf')
    end,
}
