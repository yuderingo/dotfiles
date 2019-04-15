"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim
set hlsearch
set noswapfile
set expandtab
set tabstop=2
set shiftwidth=2
set number
set backspace=indent,eol,start

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })
  " Add nerdtree
  call dein#add('scrooloose/nerdtree')

  if ((has('nvim')  || has('timers')) && has('python3')) && system('pip3 show neovim') !=# ''
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif
  elseif has('lua')
    call dein#add('Shougo/neocomplete.vim')
  endif

  "閉じタグ自動補完
  call dein#add('alvan/vim-closetag')
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb,*.php,*.vue'

  "vueシンタックス
  call dein#add('posva/vim-vue')
  autocmd FileType vue syntax sync fromstart

  "scssシンタックス
  call dein#add('cakebaker/scss-syntax.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

if dein#tap('deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
elseif dein#tap('neocomplete.vim')
  let g:neocomplete#enable_at_startup = 1
endif

autocmd VimEnter * execute 'NERDTree'
  nmap <silent> <C-e>      :NERDTreeToggle<CR>
  autocmd VimEnter * if !argc() | NERDTree | endif
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  let g:NERDTreeShowHidden=1
"End dein Scripts-------------------------

