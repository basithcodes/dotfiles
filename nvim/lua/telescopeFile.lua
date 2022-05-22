-- Dont show the binary files in preview

local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end
  }):sync()
end

-- Telescope Setup
require("telescope").setup{
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		buffer_previewer_maker = new_maker,
	},

	pickers = {
		-- Default configuration for builtin picker goes here:
		-- picker_name = {
		--	picker_config_key = value,
		--	...
		-- }
		find_files = {
			find_command = {"fd", "--type", "f", "--strip-cwd-prefix"},
		},
	},
	extensions = {
		-- Your extension configuration goes here:
		--	extension_config_key = value,
		-- }
		fzf = {
			fuzzy = true,												-- false will do the exact matching
			override_generic_sorter = true,			-- override the generic sorter
			override_file_sorter = true,				-- override the file sorter
			case_mode = "smart_case",						-- "ignore_case" or "respect_case"
			-- The default case mode is "smart case"
		}
	}
}

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
require("telescope").load_extension('harpoon')

-- Project and file navigation functions
local M = {}

-- File Navigation

-- Find files in current directory
M.curr_dir_files = function()
	require('telescope.builtin').find_files({
		prompt_title = "< Current Directory Files >",
		shorten_path = false,
	})
end

-- Directory Browser
M.file_browser = function()
	require('telescope').extensions.file_browser.file_browser({
		prompt_title = "< File Browser >",
	})
end

-- Grepping in current directory
M.curr_dir_grepping = function()
	require('telescope.builtin').live_grep({
		prompt_title = "< Grepping word in multiple files of cwd >",
	})
end

-- File browser for python programming directory
M.python_prog = function()
	require("telescope.builtin").find_files({
		prompt_title = "< All python programming files >",
		cwd = "~/Coding/python_programming/",
		width = 0.25,
		layout_config = {
			preview_width = 0.65,
		},
		file_ignore_patterns = {
		},
		file_previewer = require('telescope.previewers').vim_buffer_cat.new,
	})
end

-- Find files in stm32 specific projects(stm1 shortcut)
M.search_stm32_proj = function ()
	require("telescope").extensions.file_browser.file_browser({
		prompt_title = "< STM32 project files >",
		cwd = "~/Coding/microcontroller_programming/stm32/stm32f407vgt6/",
		width = 0.25,
		layout_config = {
			preview_width = 0.65,
		},
		file_ignore_patterns = {
			"%.jpg",
			"%.zip",
			"%.o",
			"%.out",
			"%.d"
		},
		file_previewer = require('telescope.previewers').vim_buffer_cat.new,
	})
end

-- Find files in stm32 IDE workspace(stm2 shortcut)
M.search_stm32_ide_proj = function ()
	require("telescope.builtin").find_files({
		prompt_title = "< Stm32 IDE Project Files >",
		cwd = "~/STM32CubeIDE/workspace_1.9.0/",
		width = 0.25,
		layout_config = {
			preview_width = 0.65,
		},
		file_ignore_patterns = {
			"%.jpg",
			"%.zip",
			"%.o",
			"%.out",
			"%.d"
		},
		file_previewer = require('telescope.previewers').vim_buffer_cat.new,
	})
end

-- Search files in c directory
M.search_c_directory = function ()
	require("telescope.builtin").find_files({
		prompt_title = "< All C Program Files >",
		cwd = "~/Coding/CProgramming/",
		file_ignore_patterns = {
			--"%.jpg",
			--"%.zip",
			--"%.o",
			--"%.out",
			--"%.d",
		},
		file_previewer = require('telescope.previewers').vim_buffer_cat.new,
	})
end

-- Opened Buffers
M.buffers = function ()
	require("telescope.builtin").buffers({
		prompt_title = "< Buffer Files >",
		grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
		width = 0.25,
		layout_config = {
			preview_width = 0.65,
		},
	})
end

-- Project Navigation
M.project_workspace = function()
	local char_cut
	local query = {".git"}
	local total_length
	local workspace = vim.inspect(vim.lsp.buf.list_workspace_folders())
	if workspace ~= '{}' or workspace ~= nil then
		total_length = string.len(workspace)
		char_cut = string.sub(workspace,4,total_length-3)
		--print(char_cut)
		--TODO
		--@ get actual project name
		require("telescope.builtin").find_files({
			prompt_title = "< " .. char_cut .. " >",
			file_ignore_patterns = {
				 "^docs/",
				 "%.jpg",
				 "%.zip",
				 "%.o",
				 "%.out",
				 "%.d",
				 "^Docs/",
				 "^CMSIS/docs",
				 "^CMSIS/%.lib",
				 "^CMSIS/Lib/"
			},
			cwd = char_cut,
			grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new
		})
	else
		char_cut = string.len(workspace)
		print("Not a project workspace" .. "value = " .. char_cut)
	end
end

-- config navigation
M.lua_conf = function()
	require("telescope.builtin").find_files({
		prompt_title = "Lua Configs",
		cwd = "~/.config/nvim/",
		file_previewer = require("telescope.previewers").vim_buffer_cat.new
	})
end

return M
