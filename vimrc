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
Plugin 'majutsushi/tagbar'
Plugin 'puremourning/vimspector'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Plugin 'klen/python-mode' - Consider only enable in python dev
"" IDE - chromium
Plugin 'google/vim-codefmt'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-glaive'
Plugin 'https://gn.googlesource.com/gn', { 'rtp': 'misc/vim' }
"" UML/Markdown
Plugin 'aklt/plantuml-syntax'
Plugin 'iamcco/markdown-preview.nvim'
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
set tw=80
set fo+=t
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

" horizontal <-> virtical
noremap <Leader>fvh <C-w>K
noremap <Leader>fhv <C-w>H

" CamelCase <-> PascalCase
command -range PascalToCamel :'<,'>s#_*\(\u\)\(\u*\)#\1\L\2#g
command -range CamelToPascal :'<,'>s#\(\l\+\l*\)\(\u\)#\U\1_\U\2#g

" Code formatting
call glaive#Install()
Glaive codefmt google_java_executable='java -jar /home/duswnchl/Packages/google-java-format-1.5-all-deps.jar --aosp'
map <C-I> :FormatLines<CR>

""""""""""""""""""""""""""""""""""""""""
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
let g:ycm_clangd_args = [ '-header-insertion=never', '-log=verbose', '-pretty' ]
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/youcompleteme/third_party/ycmd/.ycm_extra_conf.py"
let g:syntastic_java_checkers = []

nmap <leader>yh :YcmCompleter GoToInclude<CR>
nmap <leader>yl :YcmCompleter GoToDeclaration<CR>
nmap <leader>yi :YcmCompleter GoToImplementation<CR>
nmap <leader>yd :YcmCompleter GoTo<CR>
nmap <leader>yr :YcmCompleter GoToReferences<CR>

syntax on
