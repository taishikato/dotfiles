filetype plugin on
set encoding=utf-8
set t_Co=256
colorscheme molokai
set list
set listchars=tab:>-

source $VIMRUNTIME/macros/matchit.vim "HTMLタグをマッチさせる
" ステータスライン
"noremap <C-p> :bn<CR>
"noremap <C-n> :bp<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
autocmd BufWritePre * :%s/\s\+$//ge
set statusline=%f%=%<%m%r[%{(&fenc!=''?&fenc:&enc)}][%{&ff}][%Y][%v,%l/%L]
set nocompatible
set number
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set smartindent
set showmatch
set hidden
set backspace=2
set title
set hlsearch
set incsearch
set t_Co=256
set laststatus=2
set cursorline
set nrformats=
set noswapfile
set nobackup
set smartcase

"
" dein設定
"
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, 'tongue emoticon')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/unite.vim')
    call dein#add('fholgado/minibufexpl.vim')
    call dein#add('scrooloose/nerdtree')
    call dein#add('davidhalter/jedi-vim')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('Shougo/neocomplcache')
    call dein#add('posva/vim-vue')
    call dein#add('nikvdp/ejs-syntax')
    call dein#add('jelera/vim-javascript-syntax')
    call dein#add('tasn/vim-tsx')
    call dein#add('leafgarland/typescript-vim')
    call dein#add('peitalin/vim-jsx-typescript')
    call dein#end()
    call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

"Airline
"2016/08/05
set laststatus=2
set showtabline=2 " 常にタブラインを表示
set t_Co=256 " この設定がないと色が正しく表示されない
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='dark' "落ち着いた色調が好き
let g:airline_powerline_fonts = 1

syntax on
