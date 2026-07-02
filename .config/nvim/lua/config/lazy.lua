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
			"EdenEast/nightfox.nvim",
			config = function()
				require("nightfox").setup({
					options = {
						transparent = true,
					},
				})
				vim.cmd.colorscheme("carbonfox")
			end,
		},
		require("plugins.undotree"),
		require("plugins.telescope"),
		require("plugins.harpoon"),
		require("plugins.mini"),
		require("plugins.which-key"),
		require("plugins.gitsigns"),
		require("plugins.lspconfig"),
		require("plugins.blink"),
		require("plugins.compile-mode"),
		require("plugins.markview"),
	},
})
