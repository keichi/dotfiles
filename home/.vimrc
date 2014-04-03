"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"Vi互換をオフ
set nocompatible
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"検索語を強調表示する
set hlsearch
"コマンドライン補完を便利に
set wildmenu
"タイプ途中のコマンドを画面最下行に表示する
set showcmd
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=tab:>\ ,extends:<
"行番号を表示する
set number
"シフト移動幅
set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
"set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
set nowrapscan
"常に構文強調を使う
syntax enable
"背景を暗く設定
set background=dark
"ルーラを表示
set ruler
"Cスタイルのインデントを有効にする
set cindent
"バックアップフォルダを指定
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/swap

set shell=/bin/bash

if has('vim_starting')
set nocompatible               " Be iMproved

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" Bundles
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'yuroyoro/vim-autoclose'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'yuroyoro/vimdoc_ja'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bling/vim-airline'
NeoBundle 'tomasr/molokai'

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"プラグインの設定
let g:airline_powerline_fonts = 1
set guifont=Ricty\ Regular\ for\ Powerline:h16

colorscheme molokai
