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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/mru.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'joonty/vim-phpqa'
Plugin 'airblade/vim-gitgutter'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/tComment'
Plugin 'vim-scripts/dbext.vim'
Plugin 'bling/vim-airline'
Plugin 'joonty/vdebug'
Plugin 'nanotech/jellybeans.vim'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'phleet/vim-arcanist'

call vundle#end()
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
set wildignore+=*/tmp/*,*.so,*.swp " ignored by vim fs access
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
" let g:ctrlp_by_filename = 1
let g:ctrlp_root_markers = ['.domainconfig']
let g:ctrlp_max_files = 0
let g:ctrlp_extensions = ['tag', 'buffertag']

"let g:vdebug_options['continuous_mode'] = 1
let g:airline_section_b = '%t'
let g:airline_section_y = ''
let g:airline#extensions#tabline#enabled = 1

let g:syntastic_php_checkers = ['php']
" let g:syntastic_php_checkers = ['php', 'phpcs']
" let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" let g:phpqa_messdetector_autorun = 0
" let g:phpqa_codesniffer_autorun = 0

" If php-cs-fixer is in $PATH, you don't need to define line below
" let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the
" php-cs-fixer.phar
let g:php_cs_fixer_level = "all"                  " which level ?
let g:php_cs_fixer_config = "default"             " configuration
let g:php_cs_fixer_php_path = "php"               " Path to PHP
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0

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
" au BufNewFile,BufRead *.conf set ft=apache

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
map <leader>a :Chanstat<CR>
nmap <leader>c ::bp\|bd #<CR>
map <leader>d :Staged<CR>
map <leader>f <ESC>:NERDTreeFind<CR>
map <leader>g :GitGutterNextHunk<CR>
map <leader>h :Hangup<CR>
nmap <leader>l :set list!<CR>
map <leader>o :Workers<CR>
map <leader>p :set paste!<CR>
map <leader>r :Run<CR>
nmap <leader>s :source $MYVIMRC<CR>:noh<CR>
map <leader>t :TagbarToggle<CR>
map <leader>u :Unittest<CR>
nmap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>w :call <SID>StripTrailingWhitespaces()<CR>
"nnoremap <leader>c :Copy<CR><CR>
" map <leader>h :if exists("g:syntax_on") <Bar>
"     \ syntax off <Bar>
"     \ else <Bar>
"     \syntax on <Bar>
"     \ endif <CR>

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
"command! -nargs=* Test !phpunit <f-args>
command! Unittest !cd %:h; cd -- "$(upfind -name 'phpunit.xml.dist')"; phpunit --debug -d memory_limit=768M %
command! ViewTests !gnome-open ./bin/report/index.html

"asterisk
command! Hangup !asterisk -x 'channel request hangup all'
command! Chanstat !asterisk -x 'core show channels concise'
command! -nargs=* Release !yes y | php ext/is/nexusdomain/is/tools/asterisk_release.php <f-args>

" git commands
"command! Ann !git annotate %
"command! Stat !git status
command! -nargs=* Diff !git diff <f-args>
command! Staged Git! diff --staged

command! Workers !~/restartworkers.sh
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

