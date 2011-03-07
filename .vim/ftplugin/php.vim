" Reset to defaults
set shiftwidth&
set expandtab&

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=100
setlocal smarttab
setlocal noexpandtab
setlocal smartindent
setlocal noeol binary

" Set up automatic formatting
set formatoptions+=tcqlro

" Jump to matching bracket for 3/10th of a second (works with showmatch)
set matchtime=3
set showmatch

" Variables
let tlist_php_settings = 'php;c:class;f:function;d:constant'

" Syntax options

" Enable folding of class/function blocks
let php_folding=1

" Highlighti SQL inside PHP strings
let php_sql_query=0

" Highlight Html in strings
let php_htmlInStrings=0

" Auto-remove trailing spaces
autocmd BufWRitePre *.php call s:PhpEOFBufferWritePre() 
autocmd BufWRitePost *.php call s:PhpEOFBufferWritePost() 

" Remove ^M badness.
autocmd BufEnter *.php :%s/[ \t\r]\+$//e

function! s:PhpEOFBufferWritePre()
        "clear trailing whitespace
        :%s/\(\*\)\@<!\s\+$//ge
        :%s/\s\s*$//ge
        exe "norm :silent %s/\\s\\s*$//e\<CR>"
        "set to binary and remove eol
        let b:save_bin = &bin
        let &l:bin = 1 
        let &l:eol = 0 
endfunction

function! s:PhpEOFBufferWritePost()
        let &l:bin = b:save_bin
endfunction



