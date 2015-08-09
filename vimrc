set nocompatible              
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/Emmet.vim'
Plugin 'scrooloose/syntastic'
Plugin 'plasticboy/vim-markdown'
Plugin 'klen/python-mode'
Plugin 'mattn/emmet-vim'
Plugin 'isRuslan/vim-es6'
Plugin 'mxw/vim-jsx'
Plugin 'jussi-kalliokoski/harmony.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'airblade/vim-gitgutter'
Plugin 'derekwyatt/vim-scala'
Plugin 'guileen/vim-node-dict'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'h3xx/vim-late_evening'
Plugin 'znake/znake-vim'
Plugin 'jnurmine/Zenburn'
call vundle#end()

filetype plugin indent on
syntax on

" Environment configuration
set visualbell t_vb=
set t_Co=256
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=1000
set history=700
set nowritebackup
set encoding=utf8
set ffs=unix,dos,mac
set nobackup   
set noswapfile
set nu
set autoread
set background=dark
set mouse=a
set hidden
set wildmenu
set wildignore=*.o,*~,*.pyc
set title
set ch=2
set ignorecase
set smartcase
set hlsearch
set eol
set incsearch
set ai
set softtabstop=4
set backspace=indent,eol,start
set si
set wrap

" Text editing configuration
set tabstop=4
set expandtab
set shiftwidth=4

" Movement configuration
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Configuration for specific file types.
autocmd Filetype jade setlocal ts=2 sts=2 sw=2 nofoldenable
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 nofoldenable
autocmd Filetype bash setlocal ts=2 sts=2 sw=2 nofoldenable
autocmd Filetype sh setlocal ts=2 sts=2 sw=2 nofoldenable
autocmd Filetype sql setlocal ts=2 sts=2 sw=2 nofoldenable
autocmd Filetype css setlocal ts=2 sts=2 sw=2 nofoldenable
autocmd Filetype latex setlocal ts=2 sts=2 sw=2 nofoldenable
autocmd Filetype markdown setlocal nofoldenable
autocmd Filetype tex setlocal ts=2 sts=2 sw=2 nofoldenable
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd FileType make set noexpandtab

fun! s:setColorScheme()
    try
        colorscheme zenburn
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
    endtry
endfunction

fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

call s:setColorScheme()

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
set laststatus=2

" NerdTree configuration
let NERDTreeIgnore = ['\.pyc$']
nmap <C-f> :NERDTreeFind<CR>

" Key mappings 
let mapleader = ","
let g:mapleader = ","

"" JSX plugin configuration
let g:jsx_ext_required = 0

"" Markdown plugin configuration
let g:vim_markdown_folding_disabled=1

let g:pymode_rope_lookup_project = 0
let g:pymode_doc = 0
let g:pymode_folding = 0
set completeopt=menu
let g:syntastic_javascript_checkers = ['jslint']

nnoremap <leader>n :NERDTreeToggle .<CR>
nnoremap <leader>p :set paste!<CR>
nnoremap <leader>m :call <SID>ToggleMouse()<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>s :setlocal spell!<CR>
:nnoremap <Leader>c :set cursorline!<CR>
nmap <C-t> :TagbarToggle<CR>
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>o <C-W>
map <space> /
map <s-space> ?

:hi ColorColumn ctermbg=10000
let g:syntastic_javascript_checkers = ['eslint']

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala,javascript let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

:hi CursorLine   cterm=NONE ctermbg=black ctermfg=white guibg=darkgray guifg=white
:hi CursorColumn cterm=NONE ctermbg=black ctermfg=white guibg=darkgray guifg=white
:nnoremap <Leader>r :set cursorcolumn!<CR>
nmap ,b :NERDTreeFind<CR>

" Configuration for indentline
let g:indentLine_enabled = 0

