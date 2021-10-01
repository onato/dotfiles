set nocompatible

execute pathogen#infect()
runtime! macros/matchit.vim

filetype plugin indent on
set t_Co=256
color grb256

let g:Powerline_symbols = 'fancy'

set encoding=utf-8

set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" I love this setting but it causes huge scrolling performance slowdowns with
" syntax highlighting on large files.
" set cursorline

set mouse=a

" 4 spaces for js files
" autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" allow hiding modified buffers
set hidden

" No audible bell
set vb

" No flashing window
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set number
set ruler
syntax on

let mapleader = " "

set shell=bash

" statusline
set laststatus=2 "show the statusline on all windows
set cmdheight=1

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" reload vimrc when it changes
autocmd! BufWritePost {.vimrc,.gvimrc} source %

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,Podfile,*.podspec,Guardfile,Capfile,*.cap,*.rabl,.kick,Fastfile,Appfile,Snapfile,Deliverfile,Gymfile}   set ft=ruby
au BufRead,BufNewFile {*.fdoc} set ft=yaml

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" Set proper cursors for terminal vim in insert/normal mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Move entire lines up & down with ⌘ JK
nmap <D-j> mz:m+<cr>`z
nmap <D-k> mz:m-2<cr>`z
vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Bubble single lines (uses unimpaired.vim)
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv


" Jump to last position unless it's invalid or in an event handler
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

". when in visual mode
:xnoremap . :norm.<CR>

" Easier window movement
:nnoremap <C-H> <C-W>h
:nnoremap <C-J> <C-W>j
:nnoremap <C-K> <C-W>k
:nnoremap <C-L> <C-W>l

" Change file to new hash syntax
:nmap <D-H> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>

:nnoremap <leader>n :NERDTreeToggle<CR>
map <D-J> :NERDTreeFind<CR>
map gj :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set nowrap

" Map return to disable search highlighting
:nnoremap <return> :nohlsearch<CR><CR>

" Open Markdown files with Marked (leader-M)
:nnoremap <leader>M :silent !open -a Marked.app '%:p'<cr>

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Insert a code blocks with ctrl k/K
imap <c-k> <%<space><space>%><ESC>2hi

" project-wide find with :Ack
nmap <c-F> :Ack<space>

" Go back to last buffer
nmap <silent> <Leader>b :b#<CR>

" Quick edit vimrc
nmap <leader>V :tabe ~/.vimrc<cr>

" Run test line
" map <leader>o :call RunCurrentLineInTest()<cr>
" map <leader>t :call RunCurrentTest()<cr>

" vim-rspec
"let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
let g:rspec_command = "Dispatch rspec {spec}"
map <leader>t :call RunCurrentSpecFile()<cr>
map <leader>s :call RunNearestSpec()<cr>
map <leader>l :call RunLastSpec()<cr>

" Rails.vim shortcuts
map <leader>gc :Rcontroller<CR>
map <leader>gv :Rview<CR>
map <leader>gm :Rmodel<CR>

" Ruby 1.9 hash conversion
nmap <Leader>h :s/\:\([a-zA-Z_]\+\)\s=>/\1\:/g<cr>
vmap <Leader>h :'<,'>s/\:\([a-zA-Z_]\+\)\s=>/\1\:/g<cr>

" vim tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap td  :tabclose<CR>
nnoremap tn  :tabnew<CR>

" Move backup/swap files outside of the working dir
" (the vim docs mention that double slashes scope to a unique path to avoid
" collisions)
set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.

command! Q q " Bind :Q to :q
command! Qall qall

" control T to open a new tab and select a file
map <c-t> :tabnew<cr><c-p>

" scroll sooner
set scrolloff=5


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,coverage/**,spec/reports/**,log/**,public/images*
let g:ctrlp_custom_ignore = {
    \ 'dir':  'public$\|log$\|tmp$\|\.sass-cache$\|\.git$\|\.hg$\|\.svn$\|vendor$',
    \ 'file': '\.DS_STORE$\|tags\|*.png\|*.jpg\|*.gif',
    \ 'link': '',
    \ }
let g:ctrlp_clear_cache_on_exit=1
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Faster and respects gitignore.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching=0
endif




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!bundle exec cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!bundle exec rspec")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

function! CorrectTestRunner()
  if match(expand('%'), '\.feature$') != -1
    return "bundle exec cucumber"
  elseif match(expand('%'), '_spec\.rb$') != -1
    return "bundle exec rspec"
  else
    return "ruby"
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" tab in normal mode skips words
nmap <tab> w

" XMPFilter
nmap <buffer> <F5> <Plug>(xmpfilter-run)
xmap <buffer> <F5> <Plug>(xmpfilter-run)
imap <buffer> <F5> <Plug>(xmpfilter-run)

nmap <buffer> <F4> <Plug>(xmpfilter-mark)
xmap <buffer> <F4> <Plug>(xmpfilter-mark)
imap <buffer> <F4> <Plug>(xmpfilter-mark)


" copy current file path
nmap cp :let @" = expand("%:p")<cr>:echo "File path copied to yank buffer"<cr>


