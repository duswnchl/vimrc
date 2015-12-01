""""""""""""""""""""""""""""""""""""""""
"           Vundle Settings            "
""""""""""""""""""""""""""""""""""'"""""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
" vim-scripts repos
Plugin 'L9'
" For YJCHOI
Plugin 'a.vim'
Plugin 'taglist.vim'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'
Plugin 'https://github.com/wesleyche/SrcExpl.git'
Plugin 'https://github.com/vim-scripts/Trinity.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'AutoComplPop'
Plugin 'https://github.com/sickill/vim-monokai.git'
Plugin 'wincent/command-t'
Plugin 'grep.vim'
Plugin 'https://github.com/aklt/plantuml-syntax.git'
Plugin 'https://github.com/wannesm/wmgraphviz.vim.git'
Plugin 'rust-lang/rust.vim'
Plugin 'auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'git://github.com/will133/vim-dirdiff'
Plugin 'ShowTrailingWhitespace'
Plugin 'lsdr/monokai'
Plugin 'bling/vim-airline'
Plugin 'Rykka/InstantRst'
Plugin 'https://github.com/alvan/vim-closetag.git'

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

" Color Scheme
set laststatus=2
colorscheme monokai

set backspace+=start,eol,indent

" Remove white trailing
nnoremap <Leader>rtw :%s/\s\+$//e<CR>"

" AutoClose for html
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

""""""""""""""""""""""""""""""""""""""""
"              Graphviz                "
""""""""""""""""""""""""""""""""""""""'"
let g:WMGraphviz_output = 'png'

""""""""""""""""""""""""""""""""""""""""
"                Grep                  "
""""""""""""""""""""""""""""""""""""""'"
if executable('ag')
    let Grep_Path = '/usr/bin/ag'
endif

let Grep_Skip_Files='ChangeLog* tags *.bak *.o *.order *.mm *.html *.txt'

" Search a word under the cursor
nmap <C-G> yiw:Rgrep <C-R>"<CR>

""""""""""""""""""""""""""""""""""""""""
"              Command-t               "
""""""""""""""""""""""""""""""""""""""'"
let g:CommandTMaxFiles = 1000000
let g:CommandTMaxDepth = 30
let g:CommandTFileScanner = "watchman"

""""""""""""""""""""""""""""""""""""""""
"     Switch between source/header     "
""""""""""""""""""""""""""""""""""""""'"
map <C-A> :A<CR>

""""""""""""""""""""""""""""""""""""""""
"       Vim like a source insight      "
""""""""""""""""""""""""""""""""""'"""""
nmap <F6> :TlistToggle<CR>
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
let Tlist_Use_Left_Window = 1

nmap <F7> :NERDTreeToggle<CR>
let NERDTreeWinPos = "right"

nmap <F8> :SrcExplToggle<CR>

nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_isUpdateTags = 0

let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
map <F2> :tnext^M
map <F3> :tprevious^M

nmap <F9> :TrinityToggleAll<CR>

syntax on
