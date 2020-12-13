"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""Plugin"""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
"""""""""""""
"""" MISC """
"""""""""""""

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
Plug 'mg979/vim-visual-multi'
" easy motions
Plug 'easymotion/vim-easymotion'
" change into {} ()
Plug 'wellle/targets.vim'
" preview markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" color syntax with jsx
Plug 'mxw/vim-jsx'

"""""""""""""
""" THEME """
"""""""""""""

" Plug 'dikiaap/minimalist'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

"""""""""""""
"""" FZF """"
"""""""""""""

" fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"""""""""""""""
"""" COC """"""
"""""""""""""""
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
"""""""" COC  """""""""
"""""""""""""""""""""""

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
""""" React Color """""
"""""""""""""""""""""""

" dark red
" hi tsxTagName guifg=#E06C75
" hi tsxComponentName guifg=#E06C75
" hi tsxCloseComponentName guifg=#E06C75

" orange
" hi tsxCloseString guifg=#F99575
" hi tsxCloseTag guifg=#F99575
" hi tsxCloseTagName guifg=#F99575
" hi tsxAttributeBraces guifg=#F99575
" hi tsxEqual guifg=#F99575

" yellow
" hi tsxAttrib guifg=#F8BD7F cterm=italic

" light-grey
" hi tsxTypeBraces guifg=#999999
" dark-grey
" hi tsxTypes guifg=#666666

" hi ReactState guifg=#C176A7
" hi ReactProps guifg=#D19A66
" hi ApolloGraphQL guifg=#CB886B
" hi Events ctermfg=204 guifg=#56B6C2
" hi ReduxKeywords ctermfg=204 guifg=#C678DD
" hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
" hi WebBrowser ctermfg=204 guifg=#56B6C2
" hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

"""""""""""""""""""""""
"""""" prettier """""""
"""""""""""""""""""""""

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
" dont open bottom window when parser error triggered
" let g:prettier#quickfix_enabled = 0

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync

"""""""""""""""""""""""
""""""" rust """"""""""
"""""""""""""""""""""""

let g:rustfmt_autosave = 1

nnoremap <silent> <Leader>cr :Cargo run<CR>
nnoremap <silent> <Leader>cc :Cargo check<CR>
nnoremap <silent> <Leader>cb :Cargo build<CR>
