-- Alpha
-- https://github.com/goolord/alpha-nvim
return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    opts = function()
        local dashboard = require("alpha.themes.dashboard")
        -- Set header
        dashboard.section.header.val = {
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
        }

        -- Set menu
        dashboard.section.buttons.val = {
            { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
            { type = "padding", val = 1 },
            dashboard.button("e", "-  File Explorer", "<cmd>Neotree reveal float<cr>"),
            dashboard.button("g", "-  LazyGit", "<cmd>LazyGit<cr>"),
            dashboard.button("r", "-  Recent",
                '<cmd>lua require("telescope.builtin").oldfiles({layout_strategy="vertical"})<cr>'),
            dashboard.button("f", "-  Find file",
                '<cmd>lua require("telescope.builtin").find_files({layout_strategy="vertical", hidden=true})<cr>'),
            dashboard.button("w", "-  Find Word",
                '<cmd>lua require("telescope.builtin").live_grep({layout_strategy="vertical", additional_args=function(opts) return {"--hidden"} end})<cr>'),
            dashboard.button("n", "-  New file", ":ene <BAR> startinsert <cr>"),
            dashboard.button("l", "-  Lazy", '<cmd>Lazy<cr>'),
            dashboard.button("M", "-  Mason", '<cmd>Mason<cr>'),
            -- dashboard.button("q", "  > Quit NVIM", "<cmd>qa<cr>"),
        }

        -- Send config to alpha.setup()
        return dashboard.opts
    end
}
