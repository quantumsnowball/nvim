-- show current file outline using LSP info
-- https://github.com/hedyhli/outline.nvim
-- (this is a fork from the original symbols-outline)
return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
        { "zo", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
        -- Your setup opts here
    },
}
