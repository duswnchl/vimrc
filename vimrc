""""""""""""""""""""""""""""""""""""""""
"           Vundle Settings            "
""""""""""""""""""""""""""""""""""'"""""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"" IDE
Plugin 'alvan/vim-closetag'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jreybert/vimagit'
Plugin 'majutsushi/tagbar'
Plugin 'puremourning/vimspector'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'
Plugin 'wincent/command-t'
Plugin 'yegappan/grep'
"" UML
Plugin 'aklt/plantuml-syntax'
Plugin 'tyru/open-browser.vim'
Plugin 'weirongxu/plantuml-previewer.vim'
"" Git helper
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"" Beautify
Plugin 'itchyny/lightline.vim'
Plugin 'jacoborus/tender.vim'
"" Convinience
Plugin 'Lokaltog/vim-easymotion'
Plugin 'JamshedVesuna/vim-markdown-preview'

call vundle#end()
filetype plugin indent on     " required!
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ

set nu
set title
set tabstop=4
set sw=4
set ic
set hlsearch
set expandtab
set modifiable
set exrc
set secure

" Color Scheme
set t_Co=256
colorscheme tender

set backspace+=start,eol,indent

" Remove white trailing
nnoremap <Leader>rtw :%s/\s\+$//e<CR>"

" AutoClose for html
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" To preview markdown
let vim_markdown_preview_github=1

""""""""""""""""""""""""""""""""""""""""
"                Grep                  "
""""""""""""""""""""""""""""""""""""""'"
" Search a word under the cursor
nmap <C-G> yiw:Rg <C-R>"<CR>

""""""""""""""""""""""""""""""""""""""""
"              Command-t               "
""""""""""""""""""""""""""""""""""""""'"
let g:CommandTMaxFiles = 1000000
let g:CommandTMaxDepth = 30
let g:CommandTInputDebounce = 50
let g:CommandTFileScanner = 'git'
let g:CommandTMaxCachedDirectories = 0

""""""""""""""""""""""""""""""""""""""""
"            NerdCommenter             "
""""""""""""""""""""""""""""""""""""""'"
let g:NERDCustomDelimiters = {
            \ 'vim': { 'left': '"' },
            \ }

""""""""""""""""""""""""""""""""""""""""
"     Switch between source/header     "
""""""""""""""""""""""""""""""""""""""'"
function! HeaderToggle()
    let filename = expand("%:t")
    if filename =~ ".cc" || filename =~ ".cpp"
        execute "e %:r.h"
    else
        if !empty(glob("%:r.cc"))
            execute "e %:r.cc"
        else
            execute "e %:r.cpp"
        endif
    endif
endfunction

nnoremap <C-A> :call HeaderToggle()<CR>

""""""""""""""""""""""""""""""""""""""""
"              lightline               "
""""""""""""""""""""""""""""""""""""""'"
set noshowmode
set laststatus=2
let g:lightline = {
                    \ 'colorscheme': 'tender',
                    \ 'active': {
                    \   'left': [ [ 'mode' ],
                    \             [ 'fugitive' ],
                    \             [ 'filename', 'modified' ] ]
                    \ },
                    \ 'component' : {
                    \       'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
                    \ },
                    \ 'component_visible_condition': {
                    \       'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
                    \ }
                    \ }

""""""""""""""""""""""""""""""""""""""""
"              Vim IDE                 "
""""""""""""""""""""""""""""""""""'"""""
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

nmap <Leader>r :TagbarToggle<CR>
let g:tagbar_width = 80

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'

syntax on
