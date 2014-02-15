"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LOAD EXTERNALS.................load external resources, start package manager
" VIM SETTINGS..................................vim built in setting overwrites
" PLUGIN SETTINGS.....................................plugin setting overwrites
" ENV SPECIFIC SETTINGS............settings that are specific to an environment
" FILE TYPE SETTINGS......................file type specific setting overwrites
" MAPPINGS..................................................custom key mappings
" COMMANDS......................................................custom commands
" COLORSCHEME..................................colorscheme and color overwrites
" SYNTAX...........................syntax (keyword) rebinding and configuration
" FUNCTIONS....................................................custom functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" $LOAD EXTERNALS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/mru.vim'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/taglist.vim'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/tComment'
Bundle 'bling/vim-airline'
Bundle 'joonty/vdebug'
Bundle 'nanotech/jellybeans.vim'

filetype plugin indent on     " required!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" $VIM SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8
set hidden                               " best. thing. ever. no buffer closed
set antialias
set cursorline                           " highlight the line cursor is on
set hlsearch                             " highlight all matches
set ignorecase                           " case insensitive searches
set incsearch                            " highlight matches while typing
set ls=2
set nowrap
set number                               " show line numbers
set showmatch                            " jump to search result
set smartcase                            " case insensitive defaul
set smartindent                          " block indentation
set softtabstop=4                        " back character length
set tabstop=4                            " tab character length
set numberwidth=4                        " set line numbers section width
set shiftwidth=4                         " shift movement length
set colorcolumn=120
set expandtab
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " ignored by vim fs access
set wildignore+=*/templates_c/*,*/bin/*
set wildignore+=*/node_modules/*
set t_Co=256
set wildmenu
set tags^=./.tags,./.TAGS,.tags,.TAGS

set nobackup                             " dont create tmp backup files
set nowritebackup                        " dont create tmp backup files
set noswapfile                           " dont create tmp backup files
set scrolloff=3                          " buffer for screen when scrolling
set ttyfast                              " makes things... smoother?

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" $PLUGIN SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDChristmasTree = 1

let g:ctrlp_max_height = 30
let g:ctrlp_by_filename = 1
let g:ctrlp_root_markers = ['.domainconfig']
let g:ctrlp_max_files = 0
let g:ctrlp_extensions = ['tag']

"let g:vdebug_options['continuous_mode'] = 1
let g:airline_section_b = '%t'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" $FILE TYPE SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au Filetype * source ~/.vim/scripts/script.vim
"au Filetype yaml source ~/.vim/scripts/yml.vim
"au Filetype yml source ~/.vim/scripts/yml.vim
"au Filetype cucumber source ~/.vim/scripts/yml.vim
"au Filetype ruby source ~/.vim/scripts/yml.vim

" file type remapping for syntax highlighting
au BufNewFile,BufRead *.md set ft=mkd
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.twig set ft=htmljinja
au BufNewFile,BufRead *.dist set ft=xml
au BufNewFile,BufRead *.pp set ft=ruby
au BufNewFile,BufRead .domainconfig set ft=dosini

" work shift
au BufNewFile,BufRead *.tpl set ft=smarty
au BufNewFile,BufRead *{.inc,.lan,.view,.act,.get,.controller} set ft=php

" apex shiat
au BufNewFile,BufRead *.cls set ft=java
au BufNewFile,BufRead *.page set ft=html
au BufNewFile,BufRead *.object set ft=xml
hi link javaCharacter javaString
hi link javaSpecialCharError javaString
hi link javaError None

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" $MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
map <leader>o <ESC>:CtrlPTag<CR>
map <C-c> <ESC>:TComment<CR>
xmap <C-c> <ESC>:'<,'>TComment<CR>
map <S-f> <ESC>:NERDTreeTabsToggle<CR>

"map <C-t> <ESC>:exec('tag '.expand("<cword>"))<CR>
map <C-l> <ESC>:echo synIDattr(synID(line("."), col("."), 1), "name")<CR>
map <C-j> <ESC>:bp<CR>
map <C-k> <ESC>:bn<CR>
map <S-s> <ESC>:w<CR>
map <C-s> <ESC>:w<CR>
map <Tab> <C-w><C-w>
nnoremap <CR> :noh<CR><CR>:<backspace>
nnoremap K i<CR><Esc>

" exit insert mode within insert mode
inoremap jj <Esc>

"map <leader><Tab> <C-w><C-w>
nmap <leader>c ::bp\|bd #<CR>
map <leader>f <ESC>:NERDTreeFind<CR>
map <leader>g :GitGutterToggle<CR>
nmap <leader>l :set list!<CR>
map <leader>p :set paste!<CR>
map <leader>r :Run<CR>
nmap <leader>s :source $MYVIMRC<CR>:noh<CR>
map <leader>t :TagbarToggle<CR>
nmap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>w :call <SID>StripTrailingWhitespaces()<CR>
"nnoremap <leader>c :Copy<CR><CR>
map <leader>h :if exists("g:syntax_on") <Bar>
    \ syntax off <Bar>
    \ else <Bar>
    \syntax on <Bar>
    \ endif <CR>

" colon, semi-colon switch
nnoremap ; :

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" $COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Ctags !ctags -R --verbose -f .tags
command! Copy !cat % | xclip -sel clip && echo "copied to clip board"
" gcc
command! GccRun !gcc % -o prog.out && chmod +x prog.out && ./prog.out && rm prog.out
command! -nargs=* GccCat !gcc % -o prog.out && chmod +x prog.out && cat <f-args> | ./prog.out && rm prog.out

" php
command! Cupdate !composer update
command! Cautoload !composer dumpautoload
command! -nargs=* Test !phpunit <f-args>
command! ViewTests !gnome-open ./bin/report/index.html

" git commands
"command! Ann !git annotate %
"command! Stat !git status
command! -nargs=* Diff !git diff <f-args>

" run scripts
command! Run !file=$(basename %);ext="${file\#\#*.}"; clear;
\ case $ext in
    \ php)
        \ php % | less
        \ ;;
    \ js)
        \ node % | less
        \ ;;
    \ py)
        \ python % | less
        \ ;;
    \ rb)
        \ ruby % | less
        \ ;;
    \ *)
        \ echo "i don't know what to do with .$ext files"
        \ ;;
\ esac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORSCHEME
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme jellybeans

hi Constant                    ctermfg=229
"hi String                      ctermfg=229
hi Statement                   ctermfg=117
hi Structure                   ctermfg=111

hi ColorColumn                              ctermbg=235
hi ExtraWhitespace             ctermfg=161
hi IncSearch                   ctermfg=0    ctermbg=193  cterm=bold
hi Search                      ctermfg=0    ctermbg=193  cterm=bold
hi SpecialKey                               ctermbg=None
hi Todo                        ctermfg=Red  ctermbg=None
hi htmlString                  ctermfg=Blue
hi NonText                     ctermfg=235  ctermbg=None
hi SpecialKey                  ctermfg=235  ctermbg=None

hi javaScriptReserved          ctermfg=None

hi link phpFunctions phpRegion
hi link phpMethods phpRegion

match ExtraWhitespace /\s\+\%#\@<!$/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax keyword phpException finally

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" todo: get function out of here
" white space
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

