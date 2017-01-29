"
" my memo by hirauchi0713
"
syntax match GTD_Status /■\S*/
syntax match Client /●\S*/
syntax match Issue /#[0-9]* \S*/
syntax match String /→.*/
syntax match Comment /;.*/

highlight link GTD_Status Function
highlight link Client     StorageClass
highlight link Issue      Tag
highlight link Comment    Comment
highlight link String     Underlined
