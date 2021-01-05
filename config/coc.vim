"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""Plugin"""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
"""""""""""""
"""" MISC """
"""""""""""""

" surround word or line with what you want
Plug 'tpope/vim-surround'
" show diff with current file into left gutter
Plug 'airblade/vim-gitgutter'
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
" change into {} () when we are not inside
Plug 'wellle/targets.vim'
" Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

""""""""""""""
"""" THEME """
""""""""""""""

" Plug 'dikiaap/minimalist'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

""""""""""""""
""""" FZF """"
""""""""""""""

" fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"""""""""""""""""""
""""" Snippet """""
"""""""""""""""""""

" repos with all snippets i use. (snimMate and ultisnips)
Plug 'honza/vim-snippets'
" snippet engine
Plug 'SirVer/ultisnips'

""""""""""""""""""""""
""""" Typescript """""
""""""""""""""""""""""

" lsp typescript
"Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript'
"Plug 'HerringtonDarkholme/yats.vim'

"""""""""""""""
""""" Ale """""
"""""""""""""""

" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
Plug 'dense-analysis/ale'

"""""""""""""""
""""" COC """""
"""""""""""""""

Plug 'neoclide/coc.nvim', {'branch': 'release'}

""""""""""""""""
""""" Rust """""
""""""""""""""""

" rust
"Plug 'rust-lang/rust.vim'

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

nnoremap <silent> <A-Left> :call MoveOrCreateWindow('h')<CR>
nnoremap <silent> <A-Down> :call MoveOrCreateWindow('j')<CR>
nnoremap <silent> <A-Up> :call MoveOrCreateWindow('k')<CR>
nnoremap <silent> <A-Right> :call MoveOrCreateWindow('l')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""Command option""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""

" need for share vimrc and use it with other system
set nocompatible
set relativenumber
syntax on
" without I cant delete with space
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
set updatetime=1200
set cmdheight=2

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

"""""""""""""
"""" FZF """"
"""""""""""""
let g:fzf_action = {
      \ 'enter': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
nnoremap <c-f> :Files<CR>
nnoremap <C-g> :Rg<Cr>
nnoremap <C-c> :Commits<Cr>
nnoremap <C-b> :Buffers<Cr>
nnoremap <C-l> :Lines<Cr>

"""""""""""""""""""""""
"""""" Ultisnips """"""
"""""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

"""""""""""""""""""""""
"""""""" Ale """"""""""
"""""""""""""""""""""""

nnoremap gd :ALEGoToDefinition<CR>
nnoremap gf :ALEGoToDefinition -tab<CR>

let g:ale_completion_enabled = 0
let g:ale_disable_lsp = 1

let g:ale_fixers = {
      \   'javascript': ['prettier', 'eslint'],
      \   'typescript': ['prettier', 'eslint', 'tslint'],
      \   'rust': ['rustfmt'],
      \}
let g:ale_linters = {
      \   'javascript': ['eslint', 'tsserver'],
      \   'typescript': ['eslint', 'tsserver', 'tslint'],
      \   'rust': ['rls'],
      \}


" use down arrow instead ctrl-n
function! AleCompletionDown() abort
  " Use the default CTRL-N in completion menus
  if pumvisible()
    return "\<C-n>"
  endif

  " Exit and re-enter insert mode, and use insert completion
  return "\<C-c>a\<C-n>"
endfunction

" use up arrow instead ctrl-p
function! AleCompletionUp() abort
  " Use the default CTRL-N in completion menus
  if pumvisible()
    return "\<C-p>"
  endif

  " Exit and re-enter insert mode, and use insert completion
  return "\<C-c>a\<C-p>"
endfunction

inoremap <silent> <Down> <C-R>=AleCompletionDown()<CR>
inoremap <silent> <Up> <C-R>=AleCompletionUp()<CR>

set completeopt=menu,menuone,preview,noselect,noinsert
" desabled element info into airbar
let g:ale_hover_cursor = 0

"""""""""""""""""""""""
"""""""" COC """"""""""
"""""""""""""""""""""""

let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-json',
      \ 'coc-eslint',
      \ ]

" goto
" nmap <silent> gd <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" trigger completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"show documentation when Hover
" autocmd CursorHold * silent call CocActionAsync('doHover')
nnoremap <silent> <F2> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent> <F3> :CocAction<CR>

"""""""""""""""""""""""
""""" typescript """"""
"""""""""""""""""""""""

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

"""""""""""""""""""""""
"""""" prettier """""""
"""""""""""""""""""""""

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
" dont open bottom window when parser error triggered
let g:prettier#quickfix_enabled = 0
" forced async prettier
let g:prettier#exec_cmd_async = 1

"""""""""""""""""""""""
""""""" rust """"""""""
"""""""""""""""""""""""

" let g:rustfmt_autosave = 1

" nnoremap <silent> <Leader>cr :Cargo run<CR>
" nnoremap <silent> <Leader>cc :Cargo check<CR>
" nnoremap <silent> <Leader>cb :Cargo build<CR>
