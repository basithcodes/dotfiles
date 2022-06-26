-- configure the litee.nvim library
require('litee.lib').setup({
		tree = {
				icon_set = "webdevicons"
		},
		panel = {
				orientation = "right",
				panel_size  = 30
		},
		term = {
			position = "bottom",
			term_size = 15,
		}
})

-- configure litee-filetree.nvim
--require('litee.filetree').setup({
	--hide_cursor = false,
--})

-- configure litee-symboltree.nvim
require('litee.symboltree').setup({
	icon_set = "codicons",
	hide_cursor = false,
})

-- configure litee-calltree.nvim
require('litee.calltree').setup({
	icon_set = "codicons",
	hide_cursor = false,
})

-- configure litee-bookmarks.nvim
require('litee.bookmarks').setup({
	icon_set = "codicons",
	hide_cursor = false,
})
