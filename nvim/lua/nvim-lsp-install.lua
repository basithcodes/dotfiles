---- lsp-install
--local function setup_servers()
  --require'lspinstall'.setup()

	--local servers = require'lspinstall'.installed_servers()
	--for _, server in pairs(servers) do
		--local config = make_config()

		---- language specific config
		--if server == "lua" then
			--config.settings = lua_settings
		--end

		--if server == "clangd" then
			--config.filetypes = {"c", "cpp"};
		--end

		--require'lspconfig'[server].setup{config}
	--end
--end

--setup_servers()

---- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
--require'lspinstall'.post_install_hook = function ()
  --setup_servers() -- reload installed servers
  --vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
--end
