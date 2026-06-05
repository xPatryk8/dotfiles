return {
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		opts = {
			delay = 0,
			icons = {
				mappings = true,
				keys = true and {},
			},
			spec = {
				{ "<leader>f", group = "[F]ind" },
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>g", group = "[G]it" },
			},
		},
	},
}
