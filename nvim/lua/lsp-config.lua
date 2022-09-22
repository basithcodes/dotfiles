-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	-- Mappings.
	local opts = { noremap=true, silent=true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	--buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	--buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap('n', '<leader>format', '<cmd>lua vim.lsp.buf.formatting()<CR>',         opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
		'signatures',
	}
}

-- Sumneko Lua Configs
-- Set the path to the sumneko installation
--local system_name = "Linux" -- (Linux, macOS, or Windows)
local sumneko_root_path = '/usr'
--local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/" .. "lua-language-server"

require'lspconfig'.sumneko_lua.setup {
	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
	-- An example of settings for an LSP server.
	-- For more options, see nvim-lspconfig
	settings = {
		Lua = {
			completion = {
				keywordSnippet = "Enable",
			},
			diagnostics = {
				globals = {"vim", "use"},
				--disable = {"lowercase-global"}
			},
			runtime = {
				version = "LuaJIT",
				path = {
					vim.split(package.path, ";"),
					'?.lua',
					'?/init.lua',
				},
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/treesitter")] = true,
					[vim.fn.expand("/usr/share/luajit-2.1.0-beta3/jit")] = true,
				},
				checkThirdParty = false,
			},
		}, -- Lua end
	}, -- settings end
	root_dir = require'lspconfig'.util.root_pattern{"*.launch", "*.myproj",},
}


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

-- Pyright Setup
require'lspconfig'.pyright.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = require'lspconfig'.util.root_pattern{"*.launch", "*.myproj",},
}

local opts = {noremap = true, silent = true}
vim.api.nvim_buf_set_keymap(0, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN, popup_opts = {border = "single"}})<CR>', opts)
vim.api.nvim_buf_set_keymap(0, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN, popup_opts = {border = "single"}})<CR>', opts)

