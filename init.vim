" Load the plugins
" ====
call plug#begin('~/.vim/plugged')

	" File Tree
	Plug 'preservim/nerdtree'

	" File Searching
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

	" Intellisense
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-phpls', 'coc-python', 'coc-diagnostic', 'coc-fzf-preview']
	Plug 'dense-analysis/ale'
	Plug 'sheerun/vim-polyglot'

	" Misc
    Plug 'mattn/emmet-vim'
	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-commentary'
	Plug 'ap/vim-css-color'
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'othree/html5.vim'
	Plug 'pangloss/vim-javascript'
	Plug 'evanleck/vim-svelte', {'branch': 'main'}

call plug#end()

" NERDTree
" ====
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle the tree
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Establish Sane Defaults
" ====
set clipboard=unnamed
set encoding=UTF-8
set number relativenumber
syntax on
set tabstop=4
set shiftwidth=4
" set expandtab
set noshowmode

" Indents
" ====
filetype plugin on
" filetype plugin indent on

set autoindent
set smartindent
set preserveindent
set copyindent

" CoC settings
" ====
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')

" AirLine
" =======
" set laststatus=2
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Custom Keybindings
" ====
let mapleader=" "
"
" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Quick saving
map <F1> :w<CR><Esc>
imap <F1> <Esc><F1>

" Split jumping
nnoremap <Esc>h <C-w>h
nnoremap <Esc>j <C-w>j
nnoremap <Esc>k <C-w>k
nnoremap <Esc>l <C-w>l

" FZF
set rtp+=~/.fzf
map <Leader>f :Files <CR>
map <Leader>b :Buffers <CR>

" QUICK COMMAND PROMPT
map <Leader><Leader> :

" QUICK EMMET WRAP
map <leader><cr> <c-y>,

" Remove highlight on searches
map <Leader>0 :exe "noh" <CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <Leader>x :bp <BAR> bd #<CR>
