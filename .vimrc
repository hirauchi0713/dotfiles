set ts=4
set sw=4
set ai

set imdisable

set list
set listchars=tab:^\ ,trail:~

set backupdir=/tmp
set undodir=/tmp

set hls
set autochdir
set nu
set expandtab

map <Space>> :set nu<CR>
map <Space>< :set nonu<CR>

map <Space>ev :e ~/.vimrc<CR>

map <Space>/ :noh<CR>
map <Space>- <C-W><C-S>
map <Space>_ <C-W><C-V>
map <Space>, <C-W>c

map <Space>l <C-W>l
map <Space>h <C-W>h
map <Space>j <C-W>j
map <Space>k <C-W>k

map <Space>n :e .<CR>

"status line
"set statusline=%{expand('%:p:t')}\ %<[%{expand('%:p:h')}]%=\
"%m%r%y%w[%{&fenc!=''?&fenc:&enc}][%{&ff}][%3l,%3c,%3p]
"augroup myStatusLine
"autocmd! ColorScheme * highlight StatusLine guibg=White guifg=Black
"autocmd! ColorScheme * highlight StatusLineNC guibg=Black guifg=darkgray
"augroup END
"
""html tag match
source $VIMRUNTIME/macros/matchit.vim
let b:match_words = "<div:</div>,<p:</p>"
