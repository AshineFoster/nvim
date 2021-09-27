let g:global_symbol_padding = ' '
" let g:tabline_plugin_enable = 0
" let g:statusline_plugin_enable = 0
syntax on
let g:tokyonight_style = 'night'
colorscheme tokyonight
set wrap
set number
set relativenumber
let g:rustfmt_autosave = 1
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

" let g:lightline = {'colorscheme': 'molokai'}
" Currently, wombat, solarized, powerline, powerlineish,
" jellybeans, molokai, seoul256, darcula,
" selenized_dark, selenized_black, selenized_light, selenized_white,
" Tomorrow, Tomorrow_Night, Tomorrow_Night_Blue,
" Tomorrow_Night_Bright, Tomorrow_Night_Eighties, PaperColor,
" landscape, one, materia, material, OldHope, nord, deus,
" simpleblack, srcery_drk, ayu_mirage, ayu_light, ayu_dark,
" apprentice and 16color are available.

