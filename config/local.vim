let g:global_symbol_padding = ' '
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
nnoremap !!! :!

lua << EOF
vim.fn.sign_define('LightBulbSign', { text = "", texthl = "", linehl="", numhl="" })
EOF
