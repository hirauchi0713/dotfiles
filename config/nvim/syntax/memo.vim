"
" my memo by hirauchi0713
"

"hi clear

syntax match GTD_Status /■\S*/
syntax match Client /●\S*/
syntax match Issue /#[0-9]* \S*/
syntax match Item /　*・\S*/
syntax match Paragraph /　[^・]*/
syntax match Comment /;.*/
syntax match HR /^--------------------------------------------------------------------------------$/

highlight GTD_Status ctermfg=5 ctermbg=0 cterm=bold
highlight Client     ctermfg=4
highlight Issue      ctermfg=LightGreen
highlight Item       ctermfg=1
highlight Paragraph  ctermfg=DarkGray
highlight HR         ctermfg=DarkGray ctermbg=0

highlight Comment    ctermfg=DarkGray
highlight Normal     ctermfg=DarkGray
highlight NonText    ctermfg=DarkGray ctermbg=Black
highlight CursorLine cterm=underline
