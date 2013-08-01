set nocompatible
filetype off
syntax on
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'desert256.vim'
NeoBundle 'smartword'
NeoBundle 'sudo.vim'
NeoBundle 'hrp/EnhancedCommentify'
NeoBundle 'surround.vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'AutoClose'
NeoBundle 'tpope/vim-fugitive'

" Language
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tpope/vim-rails'
NeoBundle 'groenewege/vim-less'
NeoBundle 'othree/html5.vim'
NeoBundle 'juvenn/mustache.vim'
NeoBundle 'JSON.vim'

" colorscheme
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/solarized'
NeoBundle 'jnurmine/Zenburn'

" clipboard
if has('clipboard')
  set clipboard=unnamed,autoselect
endif

" Unite
let g:unite_enable_start_insert=1
nnoremap <silent> <Space>o :<C-u>Unite file_mru file file/new directory/new -no-split -buffer-name=files<CR>
nnoremap <silent> <Space>O :<C-u>UniteWithBufferDir  file_mru file file/new directory/new -no-split -buffer-name=files<CR>
nnoremap <silent> <Space>b :<C-u>Unite buffer -immediately<CR>
nnoremap <silent> <Space>f :<C-u>Unite file_rec/async -no-split -buffer-name=files<CR>
nnoremap <Space>F :<C-u>Unite -no-split -buffer-name=files file_rec/async:
nnoremap <silent> <Space>r :<C-u>Unite register history/yank -buffer-name=register<CR>
nnoremap <silent> <Space>/ :<C-u>Unite line -buffer-name=search -start-insert<CR>
nnoremap <silent> <Space>* :<C-u>UniteWithCursorWord line -buffer-name=search<CR>
nnoremap <silent> <Space>n :<C-u>UniteResume search -no-start-insert<CR>

" unite-grep
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

nnoremap <silent> <Space>g :<C-u>Unite grep -buffer-name=search<CR>
vnoremap g* y:Unite grep<CR><CR><C-R>=escape(@", '\\.*$^[]')<CR><CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <C-c><C-c> :q<CR>
au FileType unite inoremap <silent> <buffer> <C-c><C-c> <Esc>:q<CR>

autocmd FileType unite call s:unite_local_settings()
function! s:unite_local_settings()
  nnoremap <silent><buffer><expr> <C-w>h unite#do_action('left')
  inoremap <silent><buffer><expr> <C-w>h unite#do_action('left')
  nnoremap <silent><buffer><expr> <C-w>l unite#do_action('right')
  inoremap <silent><buffer><expr> <C-w>l unite#do_action('right')
  nnoremap <silent><buffer><expr> <C-w>k unite#do_action('above')
  inoremap <silent><buffer><expr> <C-w>k unite#do_action('above')
  nnoremap <silent><buffer><expr> <C-w>j unite#do_action('below')
  inoremap <silent><buffer><expr> <C-w>j unite#do_action('below')
endfunction

" unite-outline
nnoremap <silent> <Space>l :<C-u>Unite outline -vertical -winwidth=40<CR>
nnoremap <silent> <Space>L :<C-u>Unite outline -no-quit -vertical -winwidth=40 -buffer-name=outline<CR>

" syntastic
let g:syntastic_auto_loc_list=2

" fugitive
nmap ,g [fugitive]
nnoremap [fugitive]s :<C-u>Gstatus<CR>
nnoremap [fugitive]c :<C-u>Gcommit<CR>
nnoremap [fugitive]C :<C-u>Gcommit --amend<CR>
nnoremap [fugitive]b :<C-u>Gblame<CR>
nnoremap [fugitive]a :<C-u>Gwrite<CR>
nnoremap [fugitive]d :<C-u>Gdiff<CR>
nnoremap [fugitive]D :<C-u>Gdiff --staged<CR>

" smartchr
inoremap <buffer><expr> = smartchr#loop(' = ', ' == ', '=')

" HTML
autocmd FileType html inoremap <buffer><expr> = smartchr#loop('=')

" JavaScript
autocmd FileType javascript inoremap <buffer><expr> = smartchr#loop(' = ', ' === ', ' !== ', '=')
autocmd FileType javascript inoremap <buffer><expr> , smartchr#one_of(', ', ',')
autocmd FileType javascript inoremap <buffer><expr> \ smartchr#one_of('function ', '\')

" JSON
autocmd BufEnter *.json set filetype=json

" Perl
autocmd FileType perl inoremap <buffer><expr> . smartchr#one_of('.', '->', '.')
autocmd FileType perl inoremap <buffer><expr> , smartchr#one_of(', ', ' => ', ',')
autocmd FileType perl inoremap <buffer><expr>  =  smartchr#loop(' = ', ' == ', ' != ', ' =~ ', ' !~ ', ' <=> ', '=')
autocmd BufEnter *.tt set ft=tt2

" Ruby
autocmd FileType ruby    inoremap <buffer><expr>  =  smartchr#loop(' = ', ' == ', ' != ')
autocmd FileType ruby    inoremap <buffer><expr> , smartchr#loop(', ', ' => ', ',')
autocmd FileType ruby  inoremap <buffer><expr> + smartchr#loop(' + ', ' += ', '+')
autocmd FileType ruby  inoremap <buffer><expr> - smartchr#loop('-', ' - ', ' -= ')
imap <C-Space> <C-x><C-o>
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=1

" Python
autocmd FileType python  inoremap <buffer><expr>  =  smartchr#loop(' = ', ' == ', ' != ')
autocmd FileType python  inoremap <buffer><expr> , smartchr#loop(', ', ',')
autocmd FileType python  inoremap <buffer><expr> + smartchr#loop(' + ', ' += ', '+')
autocmd FileType python  inoremap <buffer><expr> - smartchr#loop('-', ' - ', ' -= ')


" Haskell
autocmd FileType haskell setl autoindent
autocmd FileType haskell setl smartindent

" C
autocmd FileType c inoremap <buffer><expr> , smartchr#loop(', ', ',')
autocmd FileType c inoremap <buffer><expr> . smartchr#one_of('.', '->', '.')

"Coffee
autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

" Scheme
autocmd FileType scheme :let is_gauche=1

" less
autocmd BufNewFile,BufRead *.less setf less

" mustache
autocmd FileType mustache inoremap <buffer><expr> { smartchr#loop('{{', '{')
autocmd FileType mustache inoremap <buffer><expr> } smartchr#loop('}}', '}')
autocmd BufNewFile,BufRead *.hjs setf mustache

" Hatena
autocmd BufEnter **/Hatena/**/*.js setlocal softtabstop=4 shiftwidth=4
autocmd BufEnter **/Hatena/**/*.less setlocal softtabstop=4 shiftwidth=4
autocmd BufEnter **/Hatena/** setlocal path+=lib/ path+=templates/ path+=static/
autocmd BufEnter **/Hatena/**.tt setlocal includeexpr=substitute(v:fname,'^\\/','','') path+=static/
autocmd BufEnter */Hatena/*.html     set ft=tt2.html
autocmd BufEnter */Hatena/*.tt       set ft=tt2.html


"zen-coding.vim
let g:user_zen_settings  =  {
      \ 'indentation': ' ',
\ }

" no comment when paste
au FileType * set formatoptions-=ro

nnoremap <silent> <Space>. :<C-u>edit $MYVIMRC<CR>

" Key Mapping
noremap ; :
noremap : ;
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap K <C-Y>
nnoremap J <C-E>

"Reload .vimrc
nnoremap <silent> <Space>s. :<C-u>source $MYVIMRC<CR>

nnoremap <silent> <Space>, :<C-u>edit ~/.zshrc<CR>

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

" 選択範囲を検索する
vnoremap z/ <ESC>/\%V
vnoremap z? <ESC>?\%V
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" machit.vim
source $VIMRUNTIME/macros/matchit.vim

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

set wrap
set listchars=tab:>.,trail:_,extends:\
set list

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=lightblue
autocmd VimEnter,WinEnter * match ZenkakuSpace /　/

set cursorline

"quickrun.vim
silent! nmap <unique> <Leader>r <Plug>(quickrun)

let g:quickrun_config = {}
let g:quickrun_config.python = {'command' : '/usr/local/bin/python'}

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

let g:neosnippet#disable_select_mode_mappings = 0
let g:neosnippet#snippets_directory = '~/.vim/snippets'
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

filetype plugin indent on
