""""""""""""""""""""""""""""""""""""""""
"           Vundle Settings            "
""""""""""""""""""""""""""""""""""'"""""
set nocompatible               " be iMproved
filetype off                   " required!

call plug#begin()

" My plugins here:
"" IDE
Plug 'alvan/vim-closetag'
Plug 'bronson/vim-trailing-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'puremourning/vimspector'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme', { 'do': 'python3 install.py --all' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-liquid'
" Plug 'klen/python-mode' - Consider only enable in python dev
"" IDE - chromium
Plug 'google/vim-codefmt'
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'https://gn.googlesource.com/gn', { 'rtp': 'misc/vim' }
Plug 'https://github.com/kalcutter/vim-gn'
"" UML/Markdown
Plug 'aklt/plantuml-syntax'
Plug 'iamcco/markdown-preview.nvim'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'
"" Git helper
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"" Beautify
Plug 'itchyny/lightline.vim'
Plug 'jacoborus/tender.vim'
"" Convinience
Plug 'Lokaltog/vim-easymotion'

call plug#end()

filetype plugin indent on     " required!
"
" Brief help
"   :PlugInstall to install the plugins
"   :PlugUpdate to install or update the plugins
"   :PlugDiff to review the changes from the last update
"   :PlugClean to remove plugins no longer in the list

set nu
set title
set fo+=t
set ic
set hlsearch
set expandtab
set modifiable
set exrc
set secure
set spell

" Default
set tabstop=2
set shiftwidth=2
set textwidth=80
set colorcolumn=80
set clipboard=unnamedplus

au FileType java,xml setlocal tabstop=4
au FileType java,xml setlocal shiftwidth=4
au FileType java setlocal textwidth=100
au FileType java setlocal colorcolumn=100

" Color Scheme
set t_Co=256
colorscheme tender

set backspace+=start,eol,indent

" Remove white trailing
nnoremap <Leader>rtw :%s/\s\+$//e<CR>"

" AutoClose for html
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" horizontal <-> virtical
noremap <Leader>fvh <C-w>K
noremap <Leader>fhv <C-w>H

" CamelCase <-> PascalCase
command -range PascalToCamel :'<,'>s#_*\(\u\)\(\u*\)#\1\L\2#g
command -range CamelToPascal :'<,'>s#\(\l\+\l*\)\(\u\)#\U\1_\U\2#g

""""""""""""""""""""""""""""""""""""""""
"           Code formatting            "
""""""""""""""""""""""""""""""""""""""'"
"call glaive#Install()
"Glaive codefmt google_java_executable='java -jar /home/duswnchl/Packages/google-java-format-1.26.0-all-deps.jar --aosp'
"map <C-I> :FormatLines<CR>

"""""""""""""""""""""""""""""""""""""""
"            UML/Markdown              "
""""""""""""""""""""""""""""""""""""""'"
let g:mkdp_theme = 'dark'
let g:mkdp_filetypes = ['markdown']
"let g:plantuml_previewer#plantuml_jar_path = '/home/duswnchl/Packages/plantuml.jar'

""""""""""""""""""""""""""""""""""""""""
"                Grep                  "
""""""""""""""""""""""""""""""""""""""'"
" Search a word under the cursor
nmap <C-G> yiw:Rg <C-R>"<CR>
nmap <C-G>d yiw:RgDir <C-R>"

""""""""""""""""""""""""""""""""""""""""
"                FZF                   "
""""""""""""""""""""""""""""""""""""""'"
map <Leader>t :GFiles<CR>
map <Leader>b :Buffers<CR>

command! -bang -nargs=* -complete=dir RgDir
            \ call fzf#vim#grep(
            \   "rg --column --line-number --no-heading --color=always --smart-case -- ".<q-args>,
            \   <bang>0)

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
nmap <Leader>db <Plug>VimspectorBreakpoints
nmap <Leader>dv <Plug>VimspectorStepOver
nmap <Leader>di <Plug>VimspectorStepInto
nmap <Leader>do <Plug>VimspectorStepOut

" ycm
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_clangd_args = [
      "\  '-header-insertion=never',
      \  '-log=verbose',
      \  '-pretty',
      \  '--background-index',
      \  '-j=4'
      \ ]

nmap <leader>yh :YcmCompleter GoToInclude<CR>
nmap <leader>yl :YcmCompleter GoToDeclaration<CR>
nmap <leader>yi :YcmCompleter GoToImplementation<CR>
nmap <leader>yd :YcmCompleter GoTo<CR>
nmap <leader>yr :YcmCompleter GoToReferences<CR>

""""""""""""""""""""""""""""""""""""""""
"            My commends               "
""""""""""""""""""""""""""""""""""'"""""
command! CopyFilePath let @+=expand('%')
command! CopyFileName let @+=expand('%:t')

syntax on
