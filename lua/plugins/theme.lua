return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 999,
	config = function()
		require("vscode").setup({
			transparent = false,
			italic_comments = true,
		})
		require("vscode").load()
	end,
}
