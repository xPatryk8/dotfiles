local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{
			"sainnhe/gruvbox-material",
			priority = 1000,
			config = function()
				vim.g.gruvbox_material_background = "hard"
				vim.g.gruvbox_material_enable_italic = true
				vim.g.gruvbox_material_enable_bold = true
				vim.g.gruvbox_material_ui_contrast = "high"

				vim.cmd.colorscheme("gruvbox-material")
			end,
		},
		require("plugins.undotree"),
		require("plugins.telescope"),
		require("plugins.mini"),
		require("plugins.which-key"),
		require("plugins.gitsigns"),
		require("plugins.lspconfig"),
		require("plugins.blink"),
		require("plugins.compile-mode"),
		require("plugins.lazygit"),
		require("plugins.multicursor"),
	},
})
