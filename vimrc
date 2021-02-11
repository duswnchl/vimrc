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
Plugin 'a.vim'
Plugin 'alvan/vim-closetag'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'grep.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'wincent/command-t'
Plugin 'wesleyche/srcexpl'
Plugin 'ajh17/vimcompletesme'
"" Git helper
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"" Beautify
Plugin 'itchyny/lightline.vim'
Plugin 'jacoborus/tender.vim'
"" Convinience
Plugin 'Lokaltog/vim-easymotion'

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

""""""""""""""""""""""""""""""""""""""""
"                Grep                  "
""""""""""""""""""""""""""""""""""""""'"
if executable('rg')
    let Grep_Path = '/usr/bin/rg'
endif

let Grep_Skip_Files='ChangeLog* tags *.bak *.o *.order *.mm'

" Search a word under the cursor
nmap <C-G> yiw:Rgrep <C-R>"<CR>

""""""""""""""""""""""""""""""""""""""""
"              Command-t               "
""""""""""""""""""""""""""""""""""""""'"
let g:CommandTMaxFiles = 1000000
let g:CommandTMaxDepth = 30
let g:CommandTInputDebounce = 50
let g:CommandTFileScanner = 'git'
let g:CommandTMaxCachedDirectories = 0

""""""""""""""""""""""""""""""""""""""""
"            AutoComplete              "
""""""""""""""""""""""""""""""""""""""'"
let g:neocomplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""
"     Switch between source/header     "
""""""""""""""""""""""""""""""""""""""'"
map <C-A> :A<CR>

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
"           Compelete hash             "
""""""""""""""""""""""""""""""""""'"""""
"autocmd FileType bitbake :setlocal iskeyword+=.
"autocmd FileType bitbake :setlocal iskeyword-=_

"let g:remoteDict = {
                     "\ 'chromium53': 'ssh://yeonjoo.choi@wish.lge.com:29444/gpro/webos-pro/chromium53',
                     "\ 'appswitching-control-block': 'ssh://yeonjoo.choi@wish.lge.com:29444/we/wall/module/acb'
                     "\ }

"function! ReplaceToHash()
    "let l:pathForTags = g:remoteDict[expand("%:t:r")]." submissions/".expand("<cword>")
    "normal daw
    "return split(system("git ls-remote --tags ".pathForTags))[0]
"endfunction

"nmap <silent> <Leader>ch "=ReplaceToHash()<CR>P

""""""""""""""""""""""""""""""""""""""""
"       Vim like a source insight      "
""""""""""""""""""""""""""""""""""'"""""
nmap <F6> :TagbarToggle<CR>
let g:tagbar_width = 80

nmap <F8> :SrcExplToggle<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
let g:SrcExpl_winHeight = 15
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_isUpdateTags = 0

let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
map <F2> :tnext^M
map <F3> :tprevious^M

syntax on
