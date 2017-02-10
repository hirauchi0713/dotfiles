syntax enable
set background=dark
"colorscheme solarized

"abbr
ab ml1 # vim: set et sw=2 ts=2 ai si:

set modeline

set ambiwidth=double

"set clipboard=unnamed,autoselect

set ts=4
set sw=4
set ai
set si

set imdisable

set list
set listchars=tab:^\ ,trail:~

set backupdir=/tmp
set undodir=/tmp

set hls
set autochdir
set nu
set noexpandtab

map <Space>> :set nu<CR>
map <Space>< :set nonu<CR>

map <Space>ev :e ~/.vimrc<CR>
map <Space>et :e ~/.memo<CR>

map <Space>/ :noh<CR>
map <Space>- <C-W><C-S>
map <Space>_ <C-W><C-V>
map <Space>, <C-W>c

map <Space>l <C-W>l
map <Space>h <C-W>h
map <Space>j <C-W>j
map <Space>k <C-W>k

map <Space>n :e .<CR>

hi Cursor cterm=bold ctermbg=Black ctermfg=White

set cursorline
hi CursorLineNr term=bold   cterm=bold ctermfg=228 ctermbg=NONE
hi clear CursorLine

"
" URLを開いたり、Redmineのチケットを開いたり
"
map <Space>w yi]:!open <C-R>"<CR>
map <Space>r yiw:!open https://redmine.tridentworks.co.jp/issues/<C-R>"<CR>


"html tag match
source $VIMRUNTIME/macros/matchit.vim
let b:match_words = "<div:</div>,<p:</p>,<section:</section>"
