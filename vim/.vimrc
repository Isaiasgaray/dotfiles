" Sync with system clipboard. Requires `+clipboard` (e.g. `apt install vim-gtk3`)
" and a clipboard tool (`xclip`, `wl-clipboard`).
set clipboard=unnamedplus

" Display custom symbols for spaces and end-of-line characters (:set list)
set listchars=space:*,eol:$

" Set <Space> as the leader key for custom shortcuts
let mapleader = " "

set nocompatible
set background=dark
set number
set relativenumber
set mouse=a

set wildmenu
syntax on
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set smartindent
set cindent

filetype indent on

" Markdown - Pandoc
autocmd FileType markdown nnoremap <leader><CR> :w<CR>:!clear; pandoc % -f markdown+fancy_lists+startnum -t latex -o %:r".pdf"<CR>
autocmd FileType markdown nnoremap <leader>m :w<CR>:!clear; make<CR>
autocmd FileType markdown nnoremap <leader>p :!clear; xdg-open %:r".pdf" &<CR>
autocmd FileType markdown :syn match markdownIgnore "*}"
autocmd FileType markdown :syn match markdownIgnore ".*_.*"
autocmd FileType markdown :syn match markdownIgnore ".*:.*"
autocmd FileType markdown :syn match markdownIgnore "#[\.|)|-] "

" LaTeX
autocmd FileType tex nnoremap <leader><CR> :w<CR>:!clear; pdflatex %<CR>
autocmd FileType tex nnoremap <leader>p :w<CR>:!clear; xdg-open %:r".pdf"<CR>

" C
autocmd FileType c nnoremap <leader><leader> :w<CR>:!clear ; gcc % -Wall -o %:r<CR>
autocmd FileType c nnoremap <leader><CR> :!clear ; ./%:r<CR>

" Python
autocmd FileType python nnoremap <leader><CR> :w<CR>:!clear; python3 %<CR>
autocmd FileType python nnoremap <leader>t :w<CR>:!clear; python3 -m pytest %<CR>
