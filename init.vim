let LANG = 'en_US.UTF-8'

set number
set relativenumber
set hlsearch
set incsearch
set ignorecase
set tabstop=4
set shiftwidth=4
set expandtab
set noswapfile
set title
set ttimeoutlen=0

noremap k gk
noremap j gj
noremap gk k
noremap gj j
nnoremap <ESC><ESC> :noh<CR>
" Paste continuously to selected area in visual mode
vnoremap p "_dP
let mapleader = "\<Space>"
nmap <Leader>w :w<CR>
nmap <Leader>y mXggVG"+y`X
nmap <Leader>r :source $MYVIMRC<CR>
nmap <Leader>p :PlugInstall<CR>
nmap <Leader>. :edit $MYVIMRC<CR>
nmap <Leader>n :NERDTreeToggle<CR>

" turn off IME when you move to Normal Mode
if executable('zenhan')
    autocmd InsertLeave * :call system('zenhan 0')
    autocmd CmdlineLeave * :call system('zenhan 0')
endif

" Get folding working with vscode neovim plugin
if(exists("g:vscode"))
    nnoremap zM :call VSCodeNotify('editor.foldAll')<CR>
    nnoremap zR :call VSCodeNotify('editor.unfoldAll')<CR>
    nnoremap zc :call VSCodeNotify('editor.fold')<CR>
    nnoremap zC :call VSCodeNotify('editor.foldRecursively')<CR>
    nnoremap zo :call VSCodeNotify('editor.unfold')<CR>
    nnoremap zO :call VSCodeNotify('editor.unfoldRecursively')<CR>
    nnoremap za :call VSCodeNotify('editor.toggleFold')<CR>
endif


call plug#begin()
" plugin
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'markonm/traces.vim'
Plug 'skanehira/translate.vim'
Plug 'skanehira/translate.vim'
Plug 'easymotion/vim-easymotion'
Plug 'markonm/traces.vim'
Plug 'skanehira/translate.vim'
Plug 'kaz399/spzenhan.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
" color scheme
Plug 'tomasr/molokai'
call plug#end()

" change cursor form
if has('vim_starting')
    " | insert mode
    let &t_SI .= "\e[6 q"
    " [] normal mode
    let &t_EI .= "\e[2 q"
    " _ replace mode
    let &t_SR .= "\e[4 q"
endif
let &t_te .= "\e[2 q"

" status line
set laststatus=2
"let g:lightline = {
"            \ 'colorscheme': 'wombat',
"            \ }
"set wildmenu

let NERDTreeShowHidden=1
colorscheme molokai

" Enable system clipboard integration
set clipboard+=unnamedplus
let g:clipboard = {
            \   'name': 'myClipboard',
            \   'copy': {
            \      '+': 'win32yank.exe -i --crlf',
            \      '*': 'win32yank.exe -i --crlf',
            \    },
            \   'paste': {
            \      '+': 'win32yank.exe -o --lf',
            \      '*': 'win32yank.exe -o --lf',
            \   },
            \   'cache_enabled': 1,
            \ }

" setting of terminal mode
" 新規タブでターミナルモードを起動
nnoremap <silent> tt <cmd>terminal<CR>
" 下分割でターミナルモードを起動
nnoremap <silent> tx <cmd>belowright new<CR><cmd>terminal<CR>
" ターミナルを開いたらに常にinsertモードに入る
autocmd TermOpen * :startinsert
" Escでターミナルのインサートモードを抜ける
:tnoremap <Esc> <C-\><C-n>

let g:airline_theme = 'molokai'
