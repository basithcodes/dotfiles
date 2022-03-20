local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

-- File/Directory navigation
-- Find files in current directory
keymap("n", "<leader>f", [[<Cmd>lua require("telescopeFile").curr_dir_files()<CR>]], opts)
keymap("n", "<C-f>", [[<Cmd>lua require("telescopeFile").curr_dir_files()<CR>]], opts)

-- Find C files in ~/Coding/Cprogramming directory
vim.api.nvim_set_keymap('n', '<leader><leader>cp', [[<Cmd>lua require('telescopeFile').search_c_directory()<CR>]], opts)

-- File Browser
keymap("n", "<leader>dir", [[<Cmd>lua require("telescopeFile").file_browser()<CR>]], { noremap = true })

-- Grepping
-- Live grep in directory
keymap("n", "<leader>g", [[<Cmd>lua require("telescopeFile").curr_dir_grepping()<CR>]], opts)


-- Project Selection/Navigation
keymap("n", "<leader>pro", [[<Cmd>lua require("telescopeFile").project_workspace()<CR>]], opts)

-- Config Navigation
keymap("n", "<leader>lua", [[<Cmd>lua require("telescopeFile").lua_conf()<CR>]], opts)

-- File browser for python programming directory
keymap("n", "<leader>py", [[<Cmd>lua require("telescopeFile").python_prog()<CR>]], opts)

-- Buffer
keymap("n", "<leader>b", [[<Cmd>lua require("telescopeFile").buffers()<CR>]], opts)

-- nvim-tree toggle
keymap("n", "<leader>n", "<Cmd>NvimTreeToggle<CR>", opts)
