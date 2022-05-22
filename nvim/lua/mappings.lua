local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

-- File/Directory navigation
-- Find files in current directory
keymap("n", "<leader>f", [[<Cmd>lua require("telescopeFile").curr_dir_files()<CR>]], opts)
keymap("n", "<C-f>", [[<Cmd>lua require("telescopeFile").curr_dir_files()<CR>]], opts) -- Find C files in ~/Coding/Cprogramming directory vim.api.nvim_set_keymap('n', '<leader><leader>cp', [[<Cmd>lua require('telescopeFile').search_c_directory()<CR>]], opts)

-- File Browser
keymap("n", "<leader>dir", [[<Cmd>lua require("telescopeFile").file_browser()<CR>]], { noremap = true })

-- Stm32 my workspace
keymap("n", "<leader>stm1", [[<Cmd>lua require("telescopeFile").search_stm32_proj()<CR>]], { noremap = true })

-- Stm32 IDE workspace
keymap("n", "<leader>stm2", [[<Cmd>lua require("telescopeFile").search_stm32_ide_proj()<CR>]], { noremap = true })

-- Grepping
-- Live grep in directory
keymap("n", "<leader>g", [[<Cmd>lua require("telescopeFile").curr_dir_grepping()<CR>]], opts)

-- Project Selection/Navigation
keymap("n", "<leader>pro", [[<Cmd>lua require("telescopeFile").project_workspace()<CR>]], opts)

-- Config Navigation
keymap("n", "<leader>lua", [[<Cmd>lua require("telescopeFile").lua_conf()<CR>]], opts)

-- File browser for python programming directory
keymap("n", "<leader>py", [[<Cmd>lua require("telescopeFile").python_prog()<CR>]], opts)

-- File browser for c programming directory
keymap("n", "<leader><leader>cp", [[<Cmd>lua require("telescopeFile").search_c_directory()<CR>]], opts)

-- Buffer
keymap("n", "<leader>b", [[<Cmd>lua require("telescopeFile").buffers()<CR>]], opts)

-- nvim-tree toggle
keymap("n", "<leader>n", "<Cmd>NvimTreeToggle<CR>", opts)

-- Harpoon
-- view all project marks
keymap("n", "<leader>hh", [[<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]], opts)

-- add file to harpoon list
keymap("n", "<leader>ha", [[<Cmd>lua require("harpoon.mark").add_file()<CR>]], opts)

-- file navigation
keymap("n", "<leader>pp", [[<Cmd>lua require("harpoon.ui").nav_prev()<CR>]], opts)		-- navigates to next mark
keymap("n", "<leader>nn", [[<Cmd>lua require("harpoon.ui").nav_next()<CR>]], opts)		-- navigates to previous mark

-- file navigation to specific file
-- navigates to file 3
--keymap("n", "<leader>hs", [[<Cmd>lua require("harpoon.ui").nav_prev()<CR>]], opts) -- add function in harpoon.lua file

-- Harpoon telescope
keymap("n", "<leader>ht", [[<Cmd>Telescope harpoon marks<CR>]], opts)

-- setting compiler
--keymap("n", "<F5>", [[<Cmd>python3 %<CR>]], opts)
