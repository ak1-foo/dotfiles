let LANG = 'en_US.UTF-8'

set relativenumber
set clipboard+=unnamedplus
set hlsearch
set incsearch
set ignorecase
set tabstop=4
set shiftwidth=4
set noswapfile
set title
set ttimeoutlen=10

noremap k gk
noremap j gj
noremap gk k
noremap gj j
let mapleader = "\<Space>"
nmap <Leader>w :w<CR>
nmap <Leader>y myggVGy`y
nmap <Leader>r :source $MYVIMRC<CR>
nmap <Leader>. :edit $MYVIMRC<CR>

inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

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
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set wildmenu
