---- debugging
-- keymaps

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<C-b>", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<C-S-B>", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<C-lp>", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")


local dap = require('dap')
dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode',
	name = 'lldb'
}


dap.configurations.cpp = {
	{
		name = 'Launch',
		type = 'lldb',
		request = 'launch',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/a.out', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},
	},
}

dap.configurations.c = dap.configurations.cpp

-- debugging virtual text
require("nvim-dap-virtual-text").setup()

require("dapui").setup()

local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

---- dapui
--require("dapui").setup({
	--icons = { expanded = "▾", collapsed = "▸" },
	--mappings = {
		---- Use a table to apply multiple mappings
		--expand = { "<CR>", "<2-LeftMouse>" },
		--open = "o",
		--remove = "d",
		--edit = "e",
		--repl = "r",
		--toggle = "t",
	--},
	---- Expand lines larger than the window
	---- Requires >= 0.7
	--expand_lines = vim.fn.has("nvim-0.7"),
	--layouts = {
		---- You can change the order of elements in the sidebar
		--elements = {
			---- Provide as ID strings or tables with "id" and "size" keys
			--{
				--id = "scopes",
				--size = 0.25, -- Can be float or integer > 1
			--},
			--"breakpoints",
			--"stacks",
			--"watches",
		--},
		--size = 40,
		--position = "left", -- Can be "left", "right", "top", "bottom"
	--},
	--{
		--elements = { "repl", "console" },
		--size = 10,
		--position = "bottom", -- Can be "left", "right", "top", "bottom"
	--},
	--floating = {
		--max_height = nil, -- These can be integers or a float between 0 and 1.
		--max_width = nil, -- Floats will be treated as percentage of your screen.
		--border = "single", -- Border style. Can be "single", "double" or "rounded"
		--mappings = {
			--close = { "q", "<Esc>" },
		--},
	--},
	--windows = { indent = 1 },
	--render = {
		--max_type_length = nil, -- Can be integer or nil.
	--}
--})

