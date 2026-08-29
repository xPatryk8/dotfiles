return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Harpoon: add file" })

			vim.keymap.set("n", "<M-i>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<M-o>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<M-p>", function()
				harpoon:list():select(3)
			end)

			vim.keymap.set("n", "<C-x-P>", function()
				harpoon:list():prev()
			end)
			vim.keymap.set("n", "<C-x-N>", function()
				harpoon:list():next()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)
		end,
	},
}
