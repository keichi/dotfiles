" エンコーディングを設定
scriptencoding utf-8
set encoding=utf-8
"Vi互換をオフ
if &compatible
  set nocompatible
endif
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"タイプ途中のコマンドを画面最下行に表示する
set showcmd
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=tab:>\ ,extends:<
"行番号を表示する
set number
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
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
"バックアップフォルダを指定
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/swap
"Neobundleがfishでは動かなかったので
set shell=/bin/bash
"Yank to clipboard
set clipboard=unnamed,autoselect
"Helpを縦分割で開く
nnoremap <Space>h :<C-u>vert bel h<Space>
"スクロールを速くする
set lazyredraw
set ttyfast
"複数行連続してインデントするため
vnoremap > >gv
vnoremap < <gv
"コマンドラインモードでファイル名補完をできるようにした
set wildmode=longest:full
set wildmenu
"vimgrepの結果を常に別ウィンドウに表示するように
autocmd QuickFixCmdPost *grep* cwindow
"vim-markdownでのコードフォルディングを無効にする
let g:vim_markdown_folding_disabled=1
"なんかバックスペースが効かなくなるときの対策
set backspace=indent,eol,start
"行末の空白を保存時に自動的に削除するようにした
autocmd BufWritePre * :%s/\s\+$//e
"カラムガイドを表示
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
"1行の長さ
set textwidth=78

"タブ関係の設定
"タブの代わりに空白文字を挿入する
set expandtab
"シフト移動幅
set shiftwidth=4
"新しい行を作ったときに高度な自動インデントを行う
set autoindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
"スペルチェックから日本語を外す
set spelllang=en,cjk

" Neobundleの初期化
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Bundles
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'yuroyoro/vimdoc_ja'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'toyamarinyon/vim-swift'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'koron/codic-vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'rhysd/vim-operator-surround'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'csscomb/vim-csscomb'
NeoBundle 'fatih/vim-go'
NeoBundle 'nsf/gocode'
if version >= 703
    NeoBundle 'haya14busa/incsearch.vim'
endif

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='molokai'
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_color_change_percent = 20
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * : highlight IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * : highlight IndentGuidesEven ctermbg=black

" necocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
set completeopt-=preview

" NERD commenter
let NERDSpaceDelims = 1

" Settings for CtrlP
nnoremap s <Nop>
nnoremap sb :<C-u>CtrlPBuffer<CR>
" nnoremap sd :<C-u>CtrlPDir<CR>
nnoremap sl :<C-u>CtrlPLine<CR>
nnoremap sm :<C-u>CtrlPMRUFiles<CR>
nnoremap sp :<C-u>CtrlP<CR>
nnoremap sq :<C-u>CtrlPQuickfix<CR>
nnoremap ss :<C-u>CtrlPMixed<CR>
nnoremap st :<C-u>CtrlPTag<CR>
nnoremap sw <C-w><C-w>
nnoremap sn :bn<CR>
nnoremap <C-p> :<C-u>CtrlPMixed<CR>
let g:ctrlp_map = '<Nop>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']

" Settings for vim-operator-surround
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" Settings for QuickRun
nnoremap sc :<C-u>QuickRun<CR>
let g:quickrun_config={'*': {'split': ''}}
set splitbelow

" Settings for incsearch
set hlsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Settings for vim-textobj-multiblock
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

" Settings for NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"カラースキームを設定
colorscheme Monokai
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

