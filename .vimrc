set nocompatible
filetype off
syntax on
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" NeoBundle
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
" NeoBundle 'errormarker.vim'
" NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'desert256.vim'
NeoBundle 'smartword'
NeoBundle 'sudo.vim'
NeoBundle 'hrp/EnhancedCommentify'
NeoBundle 'surround.vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kana/vim-smartchr'

"" Language
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'perlomni.vim'
NeoBundle 'rails.vim'

"" colorscheme
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/solarized'
NeoBundle 'jnurmine/Zenburn'

" Key Mapping
noremap ; :
noremap : ;

let g:unite_enable_start_insert=1
nnoremap <silent> <Space>b :<C-u>Unite buffer<CR>
nnoremap <silent> <Space>f :<C-u>Unite file -buffer-name=file<CR>
nnoremap <silent> <Space>z :<C-u>Unite file_mru<CR>
nnoremap <silent> <Space>r :<C-u>Unite register -buffer-name=register<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <C-c><C-c> :q<CR>
au FileType unite inoremap <silent> <buffer> <C-c><C-c> <Esc>:q<CR>

" unite-outline
nnoremap <silent> <Space>l :<C-u>Unite outline -vertical -winwidth=40<CR>
nnoremap <silent> <Space>L :<C-u>Unite outline -no-quit -vertical -winwidth=40 -buffer-name=outline<CR>

" syntastic
let g:syntastic_auto_loc_list=2

" smartchr
inoremap <buffer><expr> = smartchr#loop(' = ', ' == ', '=')

" HTML
autocmd FileType html inoremap <buffer><expr> = smartchr#loop('=')

" JavaScript
autocmd FileType javascript inoremap <buffer><expr> = smartchr#loop(' = ', ' == ', ' === ', '=')
autocmd FileType javascript inoremap <buffer><expr> \ smartchr#one_of('function ', '\')
autocmd FileType javascript :setlocal softtabstop=4
autocmd FileType javascript :setlocal shiftwidth=4

" Perl
autocmd FileType perl inoremap <buffer><expr> . smartchr#one_of('.', '->', '.')
autocmd FileType perl inoremap <buffer><expr> , smartchr#one_of(', ', ' => ', ',')
autocmd FileType perl inoremap <buffer><expr>  =  smartchr#loop(' = ', ' == ', ' != ', ' =~ ', ' !~ ', ' <=> ', '=')

" Ruby
autocmd FileType ruby    inoremap <buffer><expr>  =  smartchr#loop(' = ', ' == ', ' === ', ' != ')
autocmd FileType ruby    inoremap <buffer><expr> , smartchr#loop(', ', ' => ', ',')

" Haskell
autocmd FileType haskell setl autoindent
autocmd FileType haskell setl smartindent

"Coffee
autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

" Ruby
imap <C-Space> <C-x><C-o>
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" Scheme
autocmd FileType scheme :let is_gauche=1 

" no comment when paste
au FileType * set formatoptions-=ro

nnoremap <silent> <Space>. :<C-u>edit $MYVIMRC<CR>

"Reload .vimrc
nnoremap <silent> <Space>s. :<C-u>source $MYVIMRC<CR>

nnoremap <silent> <Space>, :<C-u>edit ~/.zshrc<CR>

"Start NERDTree
nnoremap <silent> <Space>n :<C-u>NERDTree<CR>

" ctags
set tags=tags
nnoremap <silent> <Space>t :<C-u>Tlist<CR>
" rails.vim
nnoremap <silent> ,r :<C-u>R<CR>
nnoremap ,mo :<C-u>Rmodel 
nnoremap ,c :<C-u>Rcontroller 
nnoremap ,v :<C-u>Rview 
nnoremap ,h :<C-u>Rhelper 
nnoremap ,mi :<C-u>Rmigration 
nnoremap <silent> ,sc :<C-u>Rschema<CR>
nnoremap <silent> ,u :<C-u>Rroutes<CR>
nnoremap ,sp :<C-u>Rspec 

" setting
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

set textwidth=0
set autoread
set hidden
set backspace=indent,eol,start
set vb t_vb=

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nolist
set showmatch
set matchtime=2
set hlsearch
set showcmd

set wildmenu
set wildchar=<tab>
set wildmode=list:full
set history=10000

set smartindent
set autoindent
set backspace=2
set cindent

set langmenu=none
lang en_gb

set backup
set backupdir=~/.vim-backup
let &directory = &backupdir

set hlsearch
nmap <silent> <C-c><C-c> ;nohlsearch<CR><Esc>

set nocompatible
set number

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
"colorscheme molokai

set wrap
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

"quickrun.vim
silent! nmap <unique> <Space>r <Plug>(quickrun)

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" " Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" " Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary
let g:neocomplcache_dictionary_filetype_lists = {
     \ 'default' : ''
                 \ }
let g:neocomplcache_snippets_dir = $HOME . '/.vim/snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"


filetype plugin indent on
