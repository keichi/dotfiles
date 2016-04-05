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
" 長い行を省略しない
set display=lastline
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set ignorecase
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
set clipboard=unnamed
"Helpを縦分割で開く
nnoremap <Space>h :<C-u>vert bel h<Space>
"スクロールを速くする
set lazyredraw
set ttyfast
"複数行連続してインデントするため
vnoremap > >gv
vnoremap < <gv
"コマンドラインモードでファイル名補完をできるようにした
set wildmode=longest,full
"vimgrepの結果を常に別ウィンドウに表示するように
autocmd QuickFixCmdPost *grep* cwindow
"vim-markdownでのコードフォルディングを無効にする
let g:vim_markdown_folding_disabled=1
"vim-markdownでLaTeX数式文法を有効に
let g:vim_markdown_math = 1
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
"削除でヤンクしない
nnoremap x "_x

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
set spelllang+=cjk
" 日本語も自動で折り返されるようにする
set fo+=m

" dein.vimの設定

let g:rc_dir = '~/.vim/rc'
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" vimprocだけは最初にインストールしてほしい
if dein#check_install(['vimproc'])
  silent call dein#install(['vimproc'])
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" previm
let g:previm_enable_realtime = 1

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

" GitGutter
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk

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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.a
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" Settings for vim-operator-surround
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)
let g:operator#surround#blocks = {
\ 'mkd' : [
\       { 'block' : ["```\n", "\n```"], 'motionwise' : ['line'], 'keys' : ['`'] },
\ ] }

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
let g:incsearch#magic = '\v'
nnoremap <ESC><ESC> :nohlsearch<CR>

" Settings for vim-textobj-multiblock
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

" Settings for syntastic checker
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_tex_checkers = ['lacheck']

" Settings for NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Keymaps for ghc-mod
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

"カラースキームを設定
colorscheme Monokai
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" Map leader related keys
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nmap <Leader><Leader> V
nnoremap <Leader>b :silent make<CR>:redraw!<CR>
nnoremap <Leader>o :silent make open<CR>:redraw!<CR>

" Allow scrolling in insert mode using c-e and c-y
inoremap <C-e> <C-x><C-e>
inoremap <C-y> <C-x><C-y>

" Stop that window from popping up
map q: :q

" stop beeping
set visualbell t_vb=
set noerrorbells

