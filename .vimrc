" === VIM CONFIG =====================
" === Date: 19 June 2018 =============
" === Name: Ryan Chan ================
" ====================================

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'hdima/python-syntax'
Plug '/usr/local/opt/fzf'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'danro/rename.vim'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'

Plug 'itchyny/lightline.vim'
Plug 'taohexxx/lightline-buffer'
Plug 'crusoexia/vim-monokai'
Plug 'jaromero/vim-monokai-refined'
Plug 'NLKNguyen/papercolor-theme'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this lines



"===========    Mapping and Bindings    =========="
" editing and utilities
filetype plugin on 
set mouse=a                                         " enable mouse support
set laststatus=2                                    " always show statusline
set number                                          " show line number
set title                                           " change terminal's title
set backspace=indent,eol,start                      " allow backspace over autoindent
set autowriteall                                    " autosave files
set completeopt-=preview
set lazyredraw
set showmatch
set scrolloff=3                                     " spaces under cursor at bottom
" set cursorline                                      " cursorline (Disabled
" for its slowness

" copy and paste
set clipboard=unnamed
nnoremap y :.!pbcopy<cr>                            " copy to line clipboard
nnoremap p :r !pbpaste<cr>                          " paste clip content to current line

" undo and redo
nnoremap u :undo<cr>                                " undo
nnoremap U :redo<cr>                                " redo
set undofile                                        " allow undo since creation of file
set undodir=$HOME/.vim/undo                         " set undo directory
set history=1000                                    " increase history 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set hidden
set showtabline=2

" tab and indentation
set tabstop=4                                       " number of visual spaces per tab
set softtabstop=4                                   " number of space per tab when editing
set expandtab                                       " tabs are spaces
" set autoindent                                      " autoindent on a new line 
set smartindent
set smarttab                                        

" search
set incsearch                                       " search as characters are entered
set hlsearch                                        " highlight matches
set ignorecase                                      " ignore case when searching lowercase
set smartcase                                       " don't ignore case when inserting uppercase characters

" leader key 
let mapleader = ' '                                 " Leader Key
nnoremap <leader>L :bnext<cr>
nnoremap <leader>H :bprev<cr>

nnoremap <leader>h :wincmd h<cr>
nnoremap <leader>j :wincmd j<cr>
nnoremap <leader>k :wincmd k<cr>
nnoremap <leader>l :wincmd l<cr>
nnoremap <leader>wh :vsplit<cr>
nnoremap <leader>wl :vsplit<cr>
nnoremap <leader>wj :split<cr>
nnoremap <leader>wk :split<cr>

nnoremap <leader>Q :wqa<cr>
nnoremap <leader>q :bd<cr>



" Remap ESC key
inoremap `` <Esc>`^
set timeout timeoutlen=1000 ttimeoutlen=10

" ===== Theme ===== "
" set background=dark
set termguicolors
" set t_Co=256
colorscheme onedark 
let g:onedark_termcolor=256
highlight Normal ctermbg=NONE
syntax on 
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'component_function': {
    \ 'filename': 'LightlineFilename',
    \ }
  \ 
  \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" =============== Plugin Settings ================= "
" FZF
map <C-p> :FZF<CR>

" python syntax
let python_highlight_all = 1

" toggle tagbar
nmap <F8> :TagbarToggle<CR>

" ctags
set tags=tags
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

"" lightline-buffer configuration
" use lightline-buffer in lightline
let g:lightline = {
    \ 'colorscheme': 'one', 
    \ 'tabline': {
    \   'left': [ [ 'bufferinfo' ],
    \             [ 'separator' ],
    \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    \   'right': [ [ 'close' ], ],
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \ },
    \ 'component_function': {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \ },
    \ 'component': {
    \   'separator': '',
    \ },
    \ }

" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

" enable devicons, only support utf-8
" require <https://github.com/ryanoasis/vim-devicons>
let g:lightline_buffer_enable_devicons = 1

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1

" :help filename-modifiers
let g:lightline_buffer_fname_mod = ':t'

" hide buffer list
let g:lightline_buffer_excludes = ['vimfiler']

" max file name length
let g:lightline_buffer_maxflen = 30

" max file extension length
let g:lightline_buffer_maxfextlen = 3

" min file name length
let g:lightline_buffer_minflen = 16

" min file extension length
let g:lightline_buffer_minfextlen = 3

" reserve length for other component (e.g. info, close)
let g:lightline_buffer_reservelen = 20


" Nerd Tree Configurations
nnoremap <Leader>n :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen = 0
