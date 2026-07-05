return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "TSUpdate",
			callback = function()
				require("nvim-treesitter.parsers").smali = {
					install_info = {
						url = "https://github.com/tree-sitter-grammars/tree-sitter-smali",
						branch = "main",
					},
				}
			end,
		})

		-- Highlighting in new nvim-treesitter 	does not gets enabled automatically
		-- We need to explicitly call vim.treesitter.start() when needed filetype gets opened
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "c", "cpp", "lua", "bash", "html", "markdown", "smali" },
			callback = function()
				vim.treesitter.start()
			end,
		})
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})
	end,

	-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
	--  If you are experiencing weird indenting issues, add the language to
	--  the list of additional_vim_regex_highlighting and disabled languages for indent.
	-- There are additional nvim-treesitter modules that you can use to interact
	-- with nvim-treesitter. You should go explore a few and see what interests you:
	--
	--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
	--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
	--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
