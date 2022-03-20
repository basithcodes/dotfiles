-- =================================="
--              VIM WIKI             "
-- =================================="
--  ~~~~~ Ensure files are read as what I want in vimwiki:

vim.api.nvim_set_var('vimwiki_root', '~/vimwiki')
vim.api.nvim_set_var('vimwiki_use_calendar', 1)

  vim.cmd([[
	function! VimwikiLinkHandler(link)
    try
      let image = '/usr/bin/nsxiv'
      execute '!start "'.image.'" ' . a:link
      return 1
    catch
      echo "This can happen for a variety of reasons ..."
    endtry
    return 0
  endfunction
	]])
