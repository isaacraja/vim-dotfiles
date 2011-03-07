"Start Customization 
set t_Co=256
set viminfo='20,\"50,:20,%,n~/.viminfo

if has('gui_running')
  "set guifont=Droid\ Sans\ Mono:h10
  set guifont=Consolas:h11
endif

" super tab mapping change
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

" set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

" setting Wildmenu on
set wildmenu
set wildmode=list:longest,full

" expand the window you move to
map <C-j> <C-W>j<C-w>_
map <C-k> <C-W>k<C-w>_
map <C-h> <C-w>h<C-w>_
map <C-l> <C-w>l<C-w>_

" auto switch to folder where editing file turned off for command-t plugin
" autocmd BufEnter * cd %:p:h
" set incremental search
set incsearch

" Two semicolons are easy to type. Map ;; to <Esc>
":imap jk <Esc>
inoremap jj <Esc>

" Use F10 to toggle 'paste' mode
set pastetoggle=<F10>
set tags=~/vim
"let g:ctags_command = "ctags -R ."
let g:ctags_command = "ctags -f trimbotagsvim -h \".php\" -R --exclude=\"\.svn\" --totals=yes --tag-relative=yes --PHP-kinds=+cf --regex-PHP='/abstract class ([^ ]*)/\1/c/' --regex-PHP='/interface ([^ ]*)/\1/c/' --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'" 



" MovingThroughCamelCaseWords
nnoremap <silent><C-Left> :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left> <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR> 


" Highlight current line in insert mode.
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul 


" Map <CTRL>-a to alignment function
" vnoremap <buffer> <F12> :call PhpAlign()<CR>
map <leader>al :call PhpAlign()<CR>

" Map <CTRL>-a to (un-)comment function
vnoremap <buffer> <F11> :call PhpUnComment()<CR>


map <F9> :%s/[ \t\r]\+$//e<CR>

set ignorecase

set smartcase


" Highlight long lines (soft limit: 80, hard limit: 100)

"au BufWinEnter *.php,*.py let w:m1=matchadd('Search', '\%<101v.\%>100v', -1)
"au BufWinEnter *.php,*.py let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

"Windows specific
"let g:yankring_history_dir = 'd:/utils/Vim/'

" End my customisations -- isaac

" Initially turn off the filetype detection for pathogen.vim to work correctly.
filetype off

" Call the 'pathogen' plugin initializer, to load all plugins in .vim/bundle
call pathogen#runtime_append_all_bundles() 

" You should call this line (interactively) everytime you add a new plugin.
" call pathogen#helptags()

" Enable syntax hilighting by default.
syntax on

" Now let's turn on filetype detection and indent
filetype plugin indent on

" We want our default encoding to be utf-8.
set encoding=utf-8

" The default file formats (for EOL/EOF markers) should be *nix & mac.
set fileformats=unix,mac

" I like to have backspace behave the way I expect it
set backspace=2

" The default color scheme
" colorscheme ir_black
colorscheme jellybeans
"colorscheme twilight

" Who doesn't like line numbering?
set number

" Let's keep our undo history even when we're switching buffers
" This option allows:
" - The current buffer can be put to the background without writing to disk;
" - When a background buffer becomes current again, marks and undo-history are
"   remembered.
set hidden

" A nicer status line
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ (%l/%L,%v)\ %p%%
set laststatus=2

" Change the <leader> from "\" to ",". Nobody likes moving their pinky that
" far.
let mapleader = ","

" A few shortcuts
map <leader>g :NERDTreeToggle<CR>
map <leader>l :NERDTreeFind<CR>
map <leader>r :TlistToggle<CR>

" Make some ragtag shortcuts available globally.
let g:ragtag_global_maps = 1

" DelimitMate should always try to balance matching pairs by default
let delimitMate_balance_matchpairs = 1

" Configure the syntastic plugin to be more useful
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
