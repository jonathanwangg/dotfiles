" indenting is 4 spaces
set shiftwidth=4

" auto indent based on the line you are on
set autoindent

" Automatically do "smart" indents
set smartindent

" Use jj to ESC instead
inoremap jj <Esc>



" Color Scheme {{{
execute pathogen#infect()
" enable syntax processing
syntax enable
" badwolf color scheme
colorscheme badwolf 
" }}}



" Spaces and Tabs {{{
" number of visual spaces per TAB
set tabstop=4

" number of spaces in tab when editing
set softtabstop=4

" tabs are spaces
set expandtab
" }}}



" UI Config {{{
" show line numbers
set number

" highlight current line
set cursorline

" visual autocomplete for command menu
set wildmenu

" highlight matching [ { ( ) } ]
set showmatch

" show as characters are entered
set incsearch

" highlight search matches
set hlsearch
" }}}



" Launch Config {{{
" use pathogen and extract all of the Vim plugins from their location in ~/.vim/bundles to their respective places in the ~/.vim folder
call pathogen#infect()
" }}}


" Tmux (terminal multiplexer) {{{
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}



" Custom functions {{{
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction      
" }}}
