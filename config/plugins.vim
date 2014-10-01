
" Plugin Settings
"------------------------------------------------------------------------------

if neobundle#tap('unite.vim') "{{{
	let g:unite_data_directory = $VARPATH."/unite"
	let g:unite_source_history_yank_enable = 1
	nnoremap [unite]  <Nop>
	nmap     f [unite]
	nnoremap <silent> [unite]r   :<C-u>UniteResume -no-start-insert<CR>
	nnoremap <silent> [unite]f   :<C-u>Unite file_rec/async<CR>
	nnoremap <silent> [unite]i   :<C-u>Unite file_rec/git<CR>
	nnoremap <silent> [unite]g   :<C-u>Unite grep:. -no-wrap<CR>
	nnoremap <silent> [unite]u   :<C-u>Unite source<CR>
	nnoremap <silent> [unite]t   :<C-u>Unite tag -silent<CR>
	nnoremap <silent> [unite]T   :<C-u>Unite tag/include -silent<CR>
	nnoremap <silent> [unite]l   :<C-u>Unite location_list<CR>
	nnoremap <silent> [unite]q   :<C-u>Unite quickfix<CR>
	nnoremap <silent> [unite]e   :<C-u>Unite register<CR>
	nnoremap <silent> [unite]j   :<C-u>Unite change jump -profile-name=navigate<CR>
	nnoremap <silent> [unite]h   :<C-u>Unite history/yank<CR>
	nnoremap <silent> [unite]s   :<C-u>Unite session<CR>
	nnoremap <silent> [unite]o   :<C-u>Unite outline<CR>
	nnoremap <silent> [unite]ma  :<C-u>Unite mapping -silent<CR>
	nnoremap <silent> [unite]me  :<C-u>Unite output:message -silent<CR>
	nnoremap <silent> <Leader>b  :<C-u>Unite buffer file_mru bookmark<CR>
	nnoremap <silent> <Leader>ta :<C-u>Unite tab<CR>
	" Open VimFiler with current file selected
	nnoremap <silent> [unite]a  :<C-u>VimFilerExplorer -find -winwidth=20 -split -toggle -no-quit<CR>
	" Open Unite with word under cursor or selection
	nnoremap <silent> <Leader>gf :UniteWithCursorWord file_rec/async -profile-name=navigate<CR>
	nnoremap <silent> <Leader>gg :UniteWithCursorWord grep:. -profile-name=navigate<CR>
	nnoremap <silent> <Leader>gt :UniteWithCursorWord tag -profile-name=navigate<CR>
	vnoremap <silent> <Leader>gt :<C-u>call VSetSearch('/')<CR>:execute 'Unite tag -profile-name=navigate -input='.strpart(@/,2)<CR>
	vnoremap <silent> <Leader>gg :<C-u>call VSetSearch('/')<CR>:execute 'Unite grep:. -profile-name=navigate -input='.strpart(@/,2)<CR>

	let neobundle#hooks.on_source = $VIMPATH.'/config/plugins/unite.vim'
	call neobundle#untap()
endif

"}}}
if neobundle#tap('vimfiler.vim') "{{{
	noremap <silent> <Leader>f :VimFilerExplorer -winwidth=20 -split -toggle<CR>
	noremap <silent> <Leader>a :VimFilerExplorer -find -winwidth=20 -split -toggle -no-quit<CR>
	let g:vimfiler_data_directory = $VARPATH.'/vimfiler'
	let neobundle#hooks.on_source = $VIMPATH.'/config/plugins/vimfiler.vim'
	call neobundle#untap()
endif

"}}}
if neobundle#tap('neocomplete') "{{{
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#data_directory = $VARPATH.'/complete'
	let neobundle#hooks.on_source    = $VIMPATH.'/config/plugins/neocomplete.vim'
	call neobundle#untap()
endif

"}}}
if neobundle#tap('neosnippet.vim') "{{{
	let g:neosnippet#enable_snipmate_compatibility = 0
	let g:neosnippet#disable_runtime_snippets = { '_': 1 }
	let g:neosnippet#data_directory  = $VARPATH.'/snippet'
	let g:neosnippet#snippets_directory =
				\$VIMPATH.'/snippets/rafi,'
				\.$VIMPATH.'/snippets/shougo/neosnippets,'
				\.$VARPATH.'/plugins/vim-go/gosnippets/snippets'
	call neobundle#untap()
endif

"}}}
if neobundle#tap('neomru.vim') "{{{
	let g:neomru#file_mru_path = $VARPATH.'/unite/mru/file'
	let g:neomru#directory_mru_path  = $VARPATH.'/unite/mru/directory'
	call neobundle#untap()
endif

"}}}
if neobundle#tap('echodoc.vim') "{{{
	let g:echodoc_enable_at_startup = 1
	call neobundle#untap()
endif

"}}}
if neobundle#tap('matchit.zip') "{{{
	function! neobundle#hooks.on_post_source(bundle)
		silent! execute 'doautocmd Filetype' &filetype
	endfunction
	call neobundle#untap()
endif

"}}}
if neobundle#tap('vinarise.vim') "{{{
	let g:vinarise_enable_auto_detect = 1
	call neobundle#untap()
endif

"}}}
if neobundle#tap('vim-smartchr') "{{{
	let neobundle#hooks.on_source = $VIMPATH.'/config/plugins/smartchr.vim'
	call neobundle#untap()
endif

"}}}
if neobundle#tap('vim-bookmarks') "{{{
	let g:bookmark_auto_save_dir  = $VARPATH.'/bookmarks'
	let neobundle#hooks.on_source = $VIMPATH.'/config/plugins/bookmarks.vim'
	call neobundle#untap()
endif

"}}}
if neobundle#tap('goyo.vim') "{{{
	nnoremap <Leader>G :Goyo<CR>
	let neobundle#hooks.on_source = $VIMPATH.'/config/plugins/goyo.vim'
	call neobundle#untap()
endif

"}}}
if neobundle#tap('vim-choosewin') "{{{
	nmap g<C-w>    <Plug>(choosewin)
	nmap -         <Plug>(choosewin)
	nmap <Leader>- <Plug>(choosewin-swap)
	let neobundle#hooks.on_source = $VIMPATH.'/config/plugins/choosewin.vim'
	call neobundle#untap()
endif

"}}}
if neobundle#tap('vim-session') "{{{
	let g:session_directory = $VARPATH.'/session'
	let g:session_default_overwrite = 1
	let g:session_autosave = 'no'
	let g:session_autoload = 'no'
	let g:session_persist_colors = 0
	let g:session_menu = 0
endif

"}}}
if neobundle#tap('phpcomplete.vim') "{{{
	let neobundle#hooks.on_source = $VIMPATH.'/config/plugins/phpcomplete.vim'
	call neobundle#untap()
endif

"}}}
if neobundle#tap('phpfolding.vim') "{{{
	let g:DisableAutoPHPFolding = 1  " Do not fold automatically
	call neobundle#untap()
endif

"}}}
if neobundle#tap('pdv') "{{{
	let g:pdv_template_dir = $VIMPATH.'/snippets/phpdoc'
	call neobundle#untap()
endif

"}}}
if neobundle#tap('vim-gitgutter') "{{{
	nmap <Leader>hj <Plug>GitGutterNextHunk
	nmap <Leader>hk <Plug>GitGutterPrevHunk
	nmap <Leader>ha <Plug>GitGutterStageHunk
	nmap <Leader>hu <Plug>GitGutterRevertHunk
	nmap <Leader>hp <Plug>GitGutterPreviewHunk
	let neobundle#hooks.on_source = $VIMPATH.'/config/plugins/gitgutter.vim'
	call neobundle#untap()
endif

"}}}
if neobundle#tap('syntastic') "{{{
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_error_symbol = '⚠'
	let g:syntastic_warning_symbol = ''
	let neobundle#hooks.on_source = $VIMPATH.'/config/plugins/syntastic.vim'
	call neobundle#untap()
endif

"}}}
if neobundle#tap('tagbar') "{{{
	nmap <F4> :TagbarToggle<CR>
	let neobundle#hooks.on_source = $VIMPATH.'/config/plugins/tagbar.vim'
	call neobundle#untap()
endif

"}}}
if neobundle#tap('vim-go') "{{{
	" vim-go, do not mess with my neosnippet config!
	let g:go_loaded_gosnippets = 1
	let g:go_snippet_engine = "neosnippet"
	call neobundle#untap()
endif

"}}}
if neobundle#tap('delimitMate') "{{{
	let delimitMate_expand_cr = 1
	call neobundle#untap()
endif

"}}}
if neobundle#tap('vim-markdown') "{{{
	let g:vim_markdown_initial_foldlevel = 5  " Don't start all folded
	let g:vim_markdown_frontmatter = 1
	call neobundle#untap()
endif

" }}}
if neobundle#tap('vim-mustache-handlebars') "{{{
	function! neobundle#hooks.on_post_source(bundle)
		doautocmd BufRead *.mustache, *.hogan, *.hulk, *.hjs, *.handlebars, *.hbs
	endfunction
endif

" }}}
if neobundle#tap('vim-ansible-yaml') "{{{
	function! neobundle#hooks.on_post_source(bundle)
		doautocmd BufRead *.yml
	endfunction
endif

" }}}
if neobundle#tap('vim-fugitive') "{{{
	function! neobundle#hooks.on_post_source(bundle)
		doautoall fugitive BufNewFile
	endfunction
	" ga gs gd gD gc gb gl gp gg gB gbd
	nnoremap <silent> <leader>ga :Git add %:p<CR>
	nnoremap <silent> <leader>gs :Gstatus<CR>
	nnoremap <silent> <leader>gd :Gdiff<CR>
	nnoremap <silent> <leader>gD :Gdiffoff<CR>
	nnoremap <silent> <leader>gc :Gcommit<CR>
	nnoremap <silent> <leader>gb :Gblame<CR>
	nnoremap <silent> <leader>gl :Gitv --all<CR>
	nnoremap <silent> <leader>gp :Git push<CR>
	nnoremap <silent> <leader>gB :Gbrowse<CR>
	nnoremap <silent> <leader>gbd :Gbrowse origin/develop^{}:%<CR>
	call neobundle#untap()
endif

"}}}
if neobundle#tap('gitv') "{{{
	let g:Gitv_DoNotMapCtrlKey = 1  " Do not map ctrl keys
	call neobundle#untap()
endif

"}}}
if neobundle#tap('gundo.vim') "{{{
	nnoremap <Leader>gu  :GundoToggle<CR>
	call neobundle#untap()
endif

"}}}
if neobundle#tap('vim-colorpicker') "{{{
	nmap <Leader>co :ColorPicker<CR>
	call neobundle#untap()
endif
" }}}

" vim: set ts=2 sw=2 tw=80 noet :