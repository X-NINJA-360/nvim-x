return {
	"lambdalisue/vim-suda",
	config = function()
		-- Optional: Automatically trigger sudo when a file is un-writable
		vim.g.suda_smart_edit = 1
	end,
}
