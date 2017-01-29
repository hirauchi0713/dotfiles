syntax enable
set background=dark

"colorscheme solarized
"set clipboard=unnamed,autoselect

"abbr
ab ml1 # vim: set et sw=2 ts=2 ai si:

set modeline

set ambiwidth=double


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
map <Space>en :e ~/.config/nvim/init.vim<CR>
map <Space>er :e ~/.zshrc<CR>
map <Space>ep :e ~/.zprofile<CR>

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


"html tag match
source $VIMRUNTIME/macros/matchit.vim
let b:match_words = "<div:</div>,<p:</p>,<section:</section>"

"
" my openbrowser
"
if has("mac")
	function! HandleURI()
		let l:uri=matchstr(getline("."), '[a-z]*:\/\/[^>,;:]*')
		echo l:uri
		if l:uri != ""
			exec '!open "' . l:uri . '"'
		else
			let l:issue=matchstr(getline("."), '#[0-9]\+')
			"l:issue=matchstr(l:issue, '[0-9]\+')
			echo l:issue
			if l:issue != ""
				exec "!open 'https://redmine.tridentworks.co.jp/issues/" . l:issue[1:] . "'"
			else
				echo "Not Link"
			endif
		endif
	endfunction
	map <Space>w :call HandleURI()<CR>
endif

"
" .memo syntax hilight
"
au BufRead,BufNewFile *.memo set filetype=memo

