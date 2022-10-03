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
buf_set_keymap('n', '<leaner>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', '<leader>cda', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
buf_set_keymap('n', '<leader>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>',         opts)
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
	},
}

-- Sumneko Lua Configs
-- Set the path to the sumneko installation
local sumneko_root_path = '/usr/bin/'
local sumneko_binary = "/usr/bin/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
	-- An example of settings for an LSP server.
	-- For more options, see nvim-lspconfig
	settings = { --Lua
	Lua = {
		completion = {
			keywordSnippet = "Enable",
		},
		diagnostics = {
			globals = {"vim", "use"},
			disable = {"lowercase-global"}
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

-- Clangd Setup
require'lspconfig'.clangd.setup {
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
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--print-options",
		"--pch-storage=memory",
		"--header-insertion-decorators",
		"--all-scopes-completion",
		"--completion-style=detailed",
		"-j=4",
		"--log=verbose",
	},
	filetypes = { "c", "cpp", "objc", "objcpp" },
	single_file_support = true,
	root_dir = require'lspconfig'.util.root_pattern{'*.launch', '*.myproj'}
}

--Pyright Setup
--require'lspconfig'.pyright.setup {
	--on_attach = on_attach,
	--capabilities = capabilities,
	--root_dir = require'lspconfig'.util.root_pattern{"*.launch", "*.myproj",},
--}
