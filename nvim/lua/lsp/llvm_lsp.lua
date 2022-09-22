-- C/CPP Configs
--Better clangd options???
require("clangd_extensions").setup {
	server = {
		-- options to pass to nvim-lspconfig
		-- i.e. the arguments to require("lspconfig").clangd.setup({})

		--require'lspconfig'.clangd.setup {
		handlers = {
			["textDocument/publishDiagnostics"] = vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics, {
				underline = true,
				update_in_insert = false,
				virtual_text = true,
				signs = true,
			}
			),
			["textDocument/hover"] = vim.lsp.with(
			vim.lsp.handlers.hover,{
				border = 'single'
			}
			),
			["textDocument/signatureHelp"] = vim.lsp.with(
			vim.lsp.handlers.signatureHelp, {
				border = 'single'
			}
			)
		},
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = {
			"clangd",
			"--background-index",
			"--suggest-missing-includes",
			"--clang-tidy",
			"--header-insertion=iwyu",
		},
		filetypes = { "c", "cpp",},
		-- put make files temporarily remove it if its getting in the way
		--root_dir = require'lspconfig'.util.root_pattern{"*.launch", "*.myproj", "makefile"},
		root_dir = require'lspconfig'.util.root_pattern{"*.launch", "*.myproj",},
		single_file_support = true,
		--}
	},
	extensions = {
		-- defaults:
		-- Automatically set inlay hints (type hints)
		autoSetHints = true,
		-- Whether to show hover actions inside the hover window
		-- This overrides the default hover handler
		hover_with_actions = true,
		-- These apply to the default ClangdSetInlayHints command
		inlay_hints = {
			-- Only show inlay hints for the current line
			only_current_line = false,
			-- Event which triggers a refersh of the inlay hints.
			-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
			-- not that this may cause  higher CPU usage.
			-- This option is only respected when only_current_line and
			-- autoSetHints both are true.
			only_current_line_autocmd = "CursorHold",
			-- whether to show parameter hints with the inlay hints or not
			show_parameter_hints = true,
			-- prefix for parameter hints
			parameter_hints_prefix = "<- ",
			-- prefix for all the other hints (type, chaining)
			other_hints_prefix = "=> ",
			-- whether to align to the length of the longest line in the file
			max_len_align = false,
			-- padding from the left if max_len_align is true
			max_len_align_padding = 1,
			-- whether to align to the extreme right or not
			right_align = false,
			-- padding from the right if right_align is true
			right_align_padding = 7,
			-- The color of the hints
			highlight = "Comment",
			-- The highlight group priority for extmark
			priority = 100,
		},
		ast = {
			role_icons = {
				type = "",
				declaration = "",
				expression = "",
				specifier = "",
				statement = "",
				["template argument"] = "",
			},

			kind_icons = {
				Compound = "",
				Recovery = "",
				TranslationUnit = "",
				PackExpansion = "",
				TemplateTypeParm = "",
				TemplateTemplateParm = "",
				TemplateParamObject = "",
			},

			highlights = {
				detail = "Comment",
			},
			memory_usage = {
				border = "none",
			},
			symbol_info = {
				border = "none",
			},
		},
	}
}

