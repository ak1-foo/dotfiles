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
nmap <Leader>tn <cmd>tabnew<CR>

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'simeji/winresizer'
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
" open terminal with new tab
nnoremap <silent> <Leader>tt <cmd>tabnew<CR><cmd>terminal<CR>
" open terminal at the bottom
nnoremap <silent> <Leader>tb <cmd>belowright new<CR><cmd>resize 15<CR><cmd>terminal<CR>
" start terminal with insert mode
autocmd TermOpen * :startinsert
" enter normal mode in terminal in nvim
:tnoremap <Esc> <C-\><C-n>

" airline
let g:airline_theme = 'wombat'

" easymotion
nmap <Leader>f <Plug>(easymotion-overwin-w)

" gitgutter
set updatetime=100
let g:gitgutter_override_sign_column_highlight = 0
" molokai background = 234
highlight SignColumn ctermbg=234
let g:gitgutter_sign_added = '>>'
let g:gitgutter_sign_modified = '<>'
let g:gitgutter_sign_removed = '<<'
highlight gitgutteradd    guifg=#009900 ctermfg=2
highlight gitgutterchange guifg=#0000ff ctermfg=6
highlight gitgutterdelete guifg=#ff2222 ctermfg=1
