return {
	"ej-shafran/compile-mode.nvim",
	version = "^5.0.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "m00qek/baleia.nvim", version = "v1.3.0" },
	},
	config = function()
		---@type CompileModeOpts
		vim.g.compile_mode = {
			input_word_completion = true,
			baleia_setup = true,
			use_pseudo_terminal = true,
			focus_compilation_buffer = true,
			hidden_output = {
				"%[[?0-9;]*[a-zA-Z]", -- filters control sequences
			},
		}
		vim.keymap.set("n", "<leader>c", ":Compile<CR>", { desc = "Compile mode" })
	end,
}
