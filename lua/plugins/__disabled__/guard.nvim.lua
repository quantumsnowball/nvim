-- Async formatting and linting utility for neovim 0.10+.
-- https://github.com/nvimdev/guard.nvim
return {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	init = function()
		local ft = require("guard.filetype")

		-- python
		ft("python")
        :fmt("isort")
        :append("autopep8")

		-- settings
		-- BUG: when the buffer is out of focus, the format on save will trigger successfully
		-- but the modified flag won't be reset, indicating the file was still unsaved, which
		-- is very annoying. In generall call :wa to save all buffer will not work on first go
		vim.g.guard_config = {
			-- format on write to buffer
			fmt_on_save = true,
			-- use lsp if no formatter was defined for this filetype
			lsp_as_default_formatter = true,
			-- whether or not to save the buffer after formatting
			save_on_fmt = true,
			-- automatic linting
			auto_lint = true,
			-- how frequently can linters be called
			lint_interval = 500,
		}
	end,
}
