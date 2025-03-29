-- This is a VS Code like winbar that uses nvim-navic in order to get LSP context from your language server.
-- https://github.com/utilyre/barbecue.nvim
return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    event = "BufReadPre",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
        'xiyaowong/nvim-transparent',  -- optional, needed to make winbar transparent
    },
    opts = {
        -- configurations go here
    },
}
