if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/icattus/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/icattus/.cache/dein')
  call dein#begin('/Users/icattus/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/icattus/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#load_toml('/Users/icattus/.config/nvim/toml/lang.toml', {"lazy": 1})
  call dein#load_toml('/Users/icattus/.config/nvim/toml/dein_lazy.toml', {"lazy": 1})
  call dein#load_toml('/Users/icattus/.config/nvim/toml/dein.toml', {"lazy": 0})

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax on
set laststatus=2
set hidden
set clipboard=unnamed
set noswapfile
set hls
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split
set cursorline
set cursorcolumn
set encoding=utf-8
scriptencoding=utf-8
set fileencoding=utf-8
set wildoptions+=pum
colorscheme onedark
if !has('gui_running')
  set t_Co=256
endif
set relativenumber
set autoindent
set list
set expandtab
set splitright
set completeopt-=preview
set shiftwidth=2
set tabstop=2
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
highlight Comment ctermfg=131
highlight LineNr ctermfg=245

"" yank current file 
function! ClipText(data)
  let @0=a:data
  let @"=a:data
  let @*=a:data
endfunction

"" キーマップ
" leader
let g:mapleader = "\<Space>"
nnoremap <leader>yd :call ClipText(expand('%:p'))<CR>

" 表示行移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" インサートモードでのカーソル移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <A-l> <S-Right>
inoremap <A-h> <S-Left>

" 行頭・行末移動
nnoremap <leader>cl $
nnoremap <leader>ch ^
vnoremap <leader>cl $
vnoremap <leader>ch ^

" 行追加/削除
nnoremap <leader>al :<C-u>call append(expand('.'), '')<Cr>j
vnoremap <leader>al :s/$/\r/gc<CR>
vnoremap <leader>dl :s/^$\n//gc<CR>

" 画面分割 + |に行結合をリマップ
nnoremap <Bar> $:let pos = getpos(".")<CR>:join<CR>:call setpos('.', pos)<CR>

" ペイン入れ替え
nnoremap <leader>mh <C-w>H
nnoremap <leader>mj <C-w>J
nnoremap <leader>mk <C-w>K
nnoremap <leader>ml <C-w>L

" ペイン削除
nnoremap <leader>cwh <C-w>h<C-w>c
nnoremap <leader>cwj <C-w>j<C-w>c
nnoremap <leader>cwk <C-w>k<C-w>c
nnoremap <leader>cwl <C-w>l<C-w>c

" ペインリサイズ
nnoremap <S-Left> :vertical resize -3<cr>
nnoremap <S-Down> :resize +3<cr>
nnoremap <S-Up> :resize -3<cr>
nnoremap <S-Right> :vertical resize +3<cr>

" ペイン移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" タブ関連
nnoremap <leader>ta :tabnew<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>td :tabclose<CR>

" jjでノーマルモード移行
inoremap <silent> jj <ESC>
tnoremap <silent> jj <C-\><C-n>

" indent
vnoremap > >gv
vnoremap < <gv
nnoremap > >>
nnoremap < <<

" python path
let g:python3_host_prog = "/usr/bin/python3"
let g:python_host_prog = "/usr/bin/python"

" paste from yanked buffer
nnoremap <leader>p "0p

" 完全一致検索
nnoremap <leader>sf :/\v<><Left>
" 置換
nnoremap <leader>rp :%s//<Left>

" .sbtをscalaとして
" au BufRead,BufNewFile *.sbt set filetype=scala

" change directory
nnoremap <leader>.. :cd ..<CR>

" for julia
autocmd BufRead,BufNewFile *.jl :set filetype=julia

" rust-gdb
" nnoremap <leader>rd :GdbStart rust-gdb -q target/debug

augroup FolowTerm
au!
au TermOpen * setlocal nonumber
augroup END
