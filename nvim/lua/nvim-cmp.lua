local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-u>'] = cmp.mapping.scroll_docs(4),
		--['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		--behavior = cmp.ConfirmBehavior.Replace,
		--select = true,
		['<Tab>'] = function(fallback)
			if cmp.visible() then
				--vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n', true)
				--cmp.select_next_item()
				luasnip.expand_or_jump()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		['<s-Tab>'] = function(fallback)
			if cmp.visible() then
				luasnip.jump(-1)
				--vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<s-Tab>', true, true, true), 'n', true)
				--cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},
	snippet = {
		expand = function(args)
			-- For `luasnip` user.
			require('luasnip').lsp_expand(args.body)
		end,
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},

	window = {
		completion  = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.recently_used,
			--require("clangd_extensions.cmp_scores"),
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		}
	},

	completion = {
		completeopt = 'menu,menuone,noselect',
	}
})
