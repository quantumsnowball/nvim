-- format on save, code prettify
-- https://github.com/stevearc/conform.nvim
return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	opts = {
		-- enable formatter when useful
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "autopep8" },
		},
	},
	init = function()
		local map = require("utils").map
		local format = require("conform").format

		-- auto format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				-- docs:
				-- format(opts, callback)
				-- https://github.com/stevearc/conform.nvim#formatopts-callback
				format({
					-- as given by official example
					bufnr = args.buf,
					-- default skip lsp format, always use a specific formatter
					lsp_format = "never",
					-- milliseconds to block for formatting, default = 1000
					timeout_ms = 500,
				})
			end,
		})

		-- manual trigger keymap
		map("n", ";f", format, { desc = "conform: format current buffer" })
		map("v", ";f", format, { desc = "conform: format selected lines" })
	end,
}
