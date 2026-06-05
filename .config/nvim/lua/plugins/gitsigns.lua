return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gs = require("gitsigns")

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				map("n", "<leader>gs", gs.stage_buffer, "git [s]tage buffer")
				map("n", "<leader>gr", gs.reset_buffer, "git [r]eset buffer")
				map("n", "<leader>gu", gs.undo_stage_hunk(), "git [u]ndo stage")
				map("n", "<leader>gp", gs.preview_hunk, "git [p]review hunk")
			end,
		},
	},
}
