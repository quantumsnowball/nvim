-- noicer ui
-- https://github.com/folke/noice.nvim
return {
    "folke/noice.nvim",
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        -- "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    opts = {
        cmdline = {
        },
        routes = {
        },
        messages = {
            view = "mini",
            view_error = "mini",
            view_warn = "mini",
            view_search = "mini",
        },
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
        },
        presets = {
            bottom_search = false,
            command_palette = false,
            long_message_to_split = true,
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
        },
    },
    -- stylua: ignore
    keys = {
        { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c",
            desc = "Redirect Cmdline" },
        { "<leader>snl", function() require("noice").cmd("last") end,    desc = "Noice Last Message" },
        { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
        { "<leader>sna", function() require("noice").cmd("all") end,     desc = "Noice All" },
        { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true,
            expr = true, desc = "Scroll forward", mode = { "i", "n", "s" } },
        { "<c-b>", function() if not require("noice.lsp").scroll( -4) then return "<c-b>" end end, silent = true,
            expr = true, desc = "Scroll backward", mode = { "i", "n", "s" } },
        -- open noice history in telescope
        { "<leader>sh", '<cmd>Noice telescope<cr>', desc = 'Notification History' }
    },
    init = function()
        -- when loading back the session, got double lualine for all buffers in other tabpage #bug
        vim.cmd('autocmd TabEnter * set cmdheight=0')
    end,
}
