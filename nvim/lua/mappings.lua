local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

--Modes (for reference only)
--   normal_mode = "n"
--   insert_mode = "i"
--   visual_mode = "v"
--   visual_block_mode = "x"
--   term_mode = "t"
--   command_mode = "c"

-- File/Directory navigation
-- Find files in current directory
keymap("n", "<leader>f", [[<Cmd>lua require("telescopeFile").curr_dir_files()<CR>]], opts)
keymap("n", "<C-f>", [[<Cmd>lua require("telescopeFile").curr_dir_files()<CR>]], opts)

-- Find C files in ~/Coding/Cprogramming directory 
vim.api.nvim_set_keymap('n', '<leader><leader>cp', [[<Cmd>lua require('telescopeFile').search_c_directory()<CR>]], opts)

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

-- Make file practice
keymap("n", "<leader>make", [[<Cmd>lua require("telescopeFile").make_file_practice()<CR>]], opts)

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

-- Resize with arrows
keymap("n", "<C-Up>", "<Cmd>resize -2<CR>", opts)
keymap("n", "<C-down>", "<Cmd>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", opts)

-- Compiler settings

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

-- litee.lib mappings
vim.api.nvim_set_keymap("n", "<C-t>",   ":LTPanel<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-t>t",  ":LTPanel<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>tm", ":LTTerm<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-t>h",  ":LTClearJumpHL<cr>", opts)

------ calltree specific commands
vim.api.nvim_set_keymap("n", "<C-h>o",     ":LTOpenToCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>oo",    ":LTPopOutCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>n",     ":LTNextCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>p",     ":LTPrevCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>e",     ":LTExpandCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>c",     ":LTCollapseCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>C",     ":LTCollapseAllCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>f",     ":LTFocusCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>S",     ":LTSwitchCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>j",     ":LTJumpCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>s",     ":LTJumpCalltreeSplit<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>v",     ":LTJumpCalltreeVSplit<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>t",     ":LTJumpCalltreeTab<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>i",     ":LTHoverCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>h",     ":LTHoverCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>d",     ":LTHideCalltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-h>x",     ":LTCloseCalltree<cr>", opts)

------ symboltree specific commands
vim.api.nvim_set_keymap("n", "<C-s>o", ":LTOpenToSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>oo", ":LTPopOutSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>n", ":LTNextSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>p", ":LTPrevSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>e", ":LTExpandSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>c", ":LTCollapseSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>C", ":LTCollapseAllSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>j", ":LTJumpSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>s", ":LTJumpSymboltreeSplit<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>v", ":LTJumpSymboltreeVSplit<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>t", ":LTJumpSymboltreeTab<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>i", ":LTHoverSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>d", ":LTDetailsSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>h", ":LTHideSymboltree<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>x", ":LTCloseSymboltree<cr>", opts)

------ filetree specific commands
------vim.api.nvim_set_keymap("n", "<leader><leader>", ":LTPopOutFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>o", ":LTOpenToFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>oo", ":LTPopOutFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>n", ":LTNextFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>p", ":LTPrevFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>e", ":LTExpandFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>c", ":LTCollapseFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>C", ":LTCollapseAllFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>j", ":LTJumpFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>s", ":LTJumpFiletreeSplit<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>v", ":LTJumpFiletreeVSplit<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>t", ":LTJumpFiletreeTab<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>x", ":LTCloseFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>h", ":LTHideFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>N", ":LTTouchFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>DD", ":LTRemoveFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>P", ":LTCopyFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>M", ":LTMoveFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>D", ":LTMkdirFiletree<cr>", opts)
------vim.api.nvim_set_keymap("n", "<C-x>R", ":LTTRenameFiletree<cr>", opts)

------ bookmarks specific commands
vim.api.nvim_set_keymap("n", "<C-b>n", ":LTOpenNotebook<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-b>o", ":LTOpenToNotebook<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-b>oo", ":LTPopOutNotebook<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-b>l", ":LTListNotebooks<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-b>c", ":LTCreateBookmark<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-b>h", ":LTHideBookmarks<cr>", opts)

vim.api.nvim_set_keymap("n", "<C-l>o", "<cmd>lua require('litee.lib.lsp.wrappers').buf_outgoing_calls()<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-l>i", "<cmd>lua require('litee.lib.lsp.wrappers').buf_incoming_calls()<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-l>s", "<cmd>lua require('litee.lib.lsp.wrappers').buf_document_symbol()<CR>", opts)
