-- use yazi in neovim
-- https://github.com/mikavilpas/yazi.nvim
---@type LazySpec
return {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
        -- 👇 in this section, choose your own keymappings!
        { "<leader>z", mode = { "n", "v" }, "<cmd>Yazi<cr>", desc = "Open yazi at the current file" },
    },
}
