return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc, })
					end

					map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
					map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
					map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")
					map("<leader>la", vim.lsp.buf.code_action, "[L]sp Code [A]ction")
					map("<leader>ls", vim.diagnostic.open_float, "[L]sp [S]ee error")
					map("<leader>le", vim.diagnostic.setloclist, "[L]sp [E]rrors")

					local client = vim.lsp.get_client_by_id(event.data.client_id)

					if not client then
						return
					end

					-- Format on save when supported.
					if client:supports_method("textDocument/formatting") then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = event.buf,
							callback = function()
								if vim.bo.modified and vim.bo.filetype ~= "oil" then
									vim.lsp.buf.format({
										bufnr = event.buf,
										async = false,
									})
								end
							end,
						})
					end

					-- Inlay hints.
					if client:supports_method("textDocument/inlayHint") then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(
								not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }),
								{ bufnr = event.buf }
							)
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			vim.diagnostic.config({
				severity_sort = true,

				float = {
					border = "rounded",
					source = "if_many",
				},

				underline = {
					severity = vim.diagnostic.severity.ERROR,
				},

				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						return diagnostic.message
					end,
				},
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()


			vim.lsp.config("clangd", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,

				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},

						diagnostics = {
							disable = {
								"missing-fields",
							},
						},
					},
				},
			})

			vim.lsp.enable("clangd")
			vim.lsp.enable("lua_ls")
		end,
	},
}
