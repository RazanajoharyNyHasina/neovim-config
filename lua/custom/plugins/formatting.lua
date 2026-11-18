return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				c = { "clang_format" },
				cpp = { "clang_format" },
				lua = { "stylua" },
				python = { "black" },
			},

			formatters = {
				clang_format = {
					prepend_args = {
						"--style=file:/home/rakotoarivony/.clang-format",
					},
				},
			},

			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "never",
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_format = "never",
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
