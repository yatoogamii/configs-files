"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""Plugin"""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

" theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
" fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" surround word or line with what you want
Plug 'tpope/vim-surround'
" use dot '.' for repeat last action
Plug 'tpope/vim-repeat'
" snippets html / css tringer with ctrl+y+,
Plug 'mattn/emmet-vim'
" comment vim
Plug 'tpope/vim-commentary'
" auto pairs with ' " ( { [
Plug 'jiangmiao/auto-pairs'
" replace space by dot ( . )
Plug 'Yggdroot/indentLine'
" multi cursor
Plug 'terryma/vim-multiple-cursors'
" easy motions
Plug 'easymotion/vim-easymotion'
" change into {} ()
Plug 'wellle/targets.vim'
" snippets
Plug 'honza/vim-snippets'
" Prettier                                                                                                                                                                                
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" coc vim
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""Remapp"""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""

" change leader
let mapleader=","

" disabled arrows keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" use double ',' for exit insert mode
map ,, <esc>
imap ,, <esc>

" indent all file and go back where started editing.
map <leader><leader>i mmgg=G`m

"""""""""""""
"""" FZF """"
"""""""""""""
let g:fzf_action = {
      \ 'enter': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

nnoremap <c-f> :Files<CR>

" Easy window movement and creation  https://vimrcfu.com/snippet/266
" leader + (hh)(jj)(kk)(ll)
function! MoveOrCreateWindow(key) abort
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

nnoremap <silent> <Leader>hh :call MoveOrCreateWindow('h')<CR>
nnoremap <silent> <Leader>jj :call MoveOrCreateWindow('j')<CR>
nnoremap <silent> <Leader>kk :call MoveOrCreateWindow('k')<CR>
nnoremap <silent> <Leader>ll :call MoveOrCreateWindow('l')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""Command option""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""

" need for share vimrc and use it with other system
set nocompatible
set relativenumber
syntax on
" without i cant delete with space
set backspace=indent,eol,start
" Any options that are defined for a filetype will be set with ':set'
filetype plugin on
" show command at bottom right
set showcmd
set incsearch
set ignorecase
" tab with 2 spaces
set tabstop=2
" tab with 2 spaces when use '>'
set shiftwidth=2
" convert spaces to tab
set expandtab
" page down with cursor
set scrolloff=19
" blink cursor line
set cursorline
" break line with "↳ " symbol
let &showbreak ="↳ "
" the encoding written to file
set fileencodings+=utf-8
" the encoding displayed
set encoding=utf-8
" Maintain undo history between sessions
set undofile
" Save folder undo history
set undodir=~/.vim/undodir

"""""""""""""""""""""""
""" theme and color """
"""""""""""""""""""""""
set termguicolors
set t_Co=256
set background=dark
colorscheme gruvbox
" let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""
""""" indentLine  """""                                                                                                                                                                   
"""""""""""""""""""""""

let g:indentLine_char = '·'
"enable quote into json file
let g:vim_json_conceal=0

"""""""""""""""""""""""
"""""""" coc """"""""""
"""""""""""""""""""""""

" move up and down into snippet list
inoremap <expr> <down> pumvisible() ? "\<C-n>" : "\<down>"
inoremap <expr> <up> pumvisible() ? "\<C-p>" : "\<up>"

" expend snipper with Enter
inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<TAB>'

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
