syntax on
syntax enable
set noswapfile
"set number
"set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
let &t_SI = "\e[4 q"
let &t_EI = "\e[2 q"

colorscheme sorbet

" autocmd VimEnter * call SetupVimLayout()
" autocmd VimEnter * call timer_start(1000, 'UpdateTimer', {'repeat': -1})
" autocmd VimEnter * call SetupMessages()

function! SetupVimLayout()
  vsplit
  split
  enew
  file MessagePane
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal nobuflisted
  belowright split
  enew
  file TimerPane
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal nobuflisted
  resize 10
  vert resize 40
endfunction

function! UpdateTimer()
  let l:time = strftime("%H:%M:%S")
  let l:bufnr = bufwinnr('TimerPane')
  if l:bufnr != -1
    call setbufline('TimerPane', 1, 'Current Time: ' . l:time)
  endif
endfunction

function! SetupMessages()
  call setbufline('MessagePane', 1, 'Welcome to Vim!')
  call setbufline('MessagePane', 2, 'Use :help for assistance.')
endfunction

function! SelectRightBuffer()
	wincmd l
	wincmd l
endfunction

" autocmd VimEnter * call SelectRightBuffer()

for c in range(char2nr('a'), char2nr('z'))
	execute 'nnoremap <C-w> . nr2char(c) :echo "Ctrl-w commands are disabled!"<CR>'
endfor

"cnoremap q <C-u>echo "Command :q is disabled!"<CR>
"cnoremap e <C-u>echo "Command :e is disabled!"<CR>
"cnoremap q! <C-u>echo "Command :q! is disabled!"<CR>
"cnoremap wq <C-u>echo "Command :wq is disabled!"<CR>
"cnoremap wq! <C-u>echo "Command :wq! is disabled!"<CR>
"cnoremap x <C-u>echo "Command :x is disabled!"<CR>
"cnoremap term <C-u>echo "Terminal is disabled!"<CR>
"
"cnoremap ! <C-u>echo "Shell commands are disabled!"<CR>
"cnoremap <C-i> <C-u>echo "Tab is disabled!"<CR>

" These are enter, don't remap
"cnoremap <C-M> <C-u>echo "Only :w is allowed"<CR>
"cnoremap <C-m> <C-u>echo "Only :w is allowed"<CR>

cnoremap ww <C-u>echo "Only :w is allowed"<CR>

cnoremap a <C-u>echo "Only :w is allowed"<CR>
cnoremap b <C-u>echo "Only :w is allowed"<CR>
cnoremap c <C-u>echo "Only :w is allowed"<CR>
cnoremap d <C-u>echo "Only :w is allowed"<CR>
cnoremap e <C-u>echo "Only :w is allowed"<CR>
cnoremap f <C-u>echo "Only :w is allowed"<CR>
cnoremap g <C-u>echo "Only :w is allowed"<CR>
cnoremap h <C-u>echo "Only :w is allowed"<CR>
cnoremap i <C-u>echo "Only :w is allowed"<CR>
cnoremap j <C-u>echo "Only :w is allowed"<CR>
cnoremap k <C-u>echo "Only :w is allowed"<CR>
cnoremap l <C-u>echo "Only :w is allowed"<CR>
cnoremap m <C-u>echo "Only :w is allowed"<CR>
cnoremap n <C-u>echo "Only :w is allowed"<CR>
cnoremap o <C-u>echo "Only :w is allowed"<CR>
cnoremap p <C-u>echo "Only :w is allowed"<CR>
cnoremap q <C-u>echo "Only :w is allowed"<CR>
cnoremap r <C-u>echo "Only :w is allowed"<CR>
cnoremap s <C-u>echo "Only :w is allowed"<CR>
cnoremap t <C-u>echo "Only :w is allowed"<CR>
cnoremap u <C-u>echo "Only :w is allowed"<CR>
cnoremap v <C-u>echo "Only :w is allowed"<CR>
cnoremap x <C-u>echo "Only :w is allowed"<CR>
cnoremap y <C-u>echo "Only :w is allowed"<CR>
cnoremap z <C-u>echo "Only :w is allowed"<CR>
cnoremap A <C-u>echo "Only :w is allowed"<CR>
cnoremap B <C-u>echo "Only :w is allowed"<CR>
cnoremap C <C-u>echo "Only :w is allowed"<CR>
cnoremap D <C-u>echo "Only :w is allowed"<CR>
cnoremap E <C-u>echo "Only :w is allowed"<CR>
cnoremap F <C-u>echo "Only :w is allowed"<CR>
cnoremap G <C-u>echo "Only :w is allowed"<CR>
cnoremap H <C-u>echo "Only :w is allowed"<CR>
cnoremap I <C-u>echo "Only :w is allowed"<CR>
cnoremap J <C-u>echo "Only :w is allowed"<CR>
cnoremap K <C-u>echo "Only :w is allowed"<CR>
cnoremap L <C-u>echo "Only :w is allowed"<CR>
cnoremap M <C-u>echo "Only :w is allowed"<CR>
cnoremap N <C-u>echo "Only :w is allowed"<CR>
cnoremap O <C-u>echo "Only :w is allowed"<CR>
cnoremap P <C-u>echo "Only :w is allowed"<CR>
cnoremap Q <C-u>echo "Only :w is allowed"<CR>
cnoremap R <C-u>echo "Only :w is allowed"<CR>
cnoremap S <C-u>echo "Only :w is allowed"<CR>
cnoremap T <C-u>echo "Only :w is allowed"<CR>
cnoremap U <C-u>echo "Only :w is allowed"<CR>
cnoremap V <C-u>echo "Only :w is allowed"<CR>
cnoremap W <C-u>echo "Only :w is allowed"<CR>
cnoremap X <C-u>echo "Only :w is allowed"<CR>
cnoremap Y <C-u>echo "Only :w is allowed"<CR>
cnoremap Z <C-u>echo "Only :w is allowed"<CR>
cnoremap ! <C-u>echo "Only :w is allowed"<CR>
cnoremap @ <C-u>echo "Only :w is allowed"<CR>
cnoremap # <C-u>echo "Only :w is allowed"<CR>
cnoremap $ <C-u>echo "Only :w is allowed"<CR>
cnoremap % <C-u>echo "Only :w is allowed"<CR>
cnoremap ^ <C-u>echo "Only :w is allowed"<CR>
cnoremap & <C-u>echo "Only :w is allowed"<CR>
cnoremap * <C-u>echo "Only :w is allowed"<CR>
cnoremap ( <C-u>echo "Only :w is allowed"<CR>
cnoremap ) <C-u>echo "Only :w is allowed"<CR>
cnoremap _ <C-u>echo "Only :w is allowed"<CR>
cnoremap 1 <C-u>echo "Only :w is allowed"<CR>
cnoremap 2 <C-u>echo "Only :w is allowed"<CR>
cnoremap 3 <C-u>echo "Only :w is allowed"<CR>
cnoremap 4 <C-u>echo "Only :w is allowed"<CR>
cnoremap 5 <C-u>echo "Only :w is allowed"<CR>
cnoremap 6 <C-u>echo "Only :w is allowed"<CR>
cnoremap 7 <C-u>echo "Only :w is allowed"<CR>
cnoremap 8 <C-u>echo "Only :w is allowed"<CR>
cnoremap 9 <C-u>echo "Only :w is allowed"<CR>
cnoremap 0 <C-u>echo "Only :w is allowed"<CR>
cnoremap - <C-u>echo "Only :w is allowed"<CR>
cnoremap , <C-u>echo "Only :w is allowed"<CR>
cnoremap . <C-u>echo "Only :w is allowed"<CR>
cnoremap / <C-u>echo "Only :w is allowed"<CR>
cnoremap < <C-u>echo "Only :w is allowed"<CR>
cnoremap > <C-u>echo "Only :w is allowed"<CR>
cnoremap ? <C-u>echo "Only :w is allowed"<CR>
cnoremap ] <C-u>echo "Only :w is allowed"<CR>
cnoremap \\ <C-u>echo "Only :w is allowed"<CR>
cnoremap ' <C-u>echo "Only :w is allowed"<CR>
cnoremap } <C-u>echo "Only :w is allowed"<CR>
cnoremap \| <C-u>echo "Only :w is allowed"<CR>
cnoremap " <C-u>echo "Only :w is allowed"<CR>
cnoremap ` <C-u>echo "Only :w is allowed"<CR>
cnoremap ~ <C-u>echo "Only :w is allowed"<CR>
cnoremap [ <C-u>echo "Only :w is allowed"<CR>
cnoremap { <C-u>echo "Only :w is allowed"<CR>
cnoremap = <C-u>echo "Only :w is allowed"<CR>
cnoremap + <C-u>echo "Only :w is allowed"<CR>
cnoremap <SPACE> <C-u>echo "Only :w is allowed"<CR>

cnoremap <C-a> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-b> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-c> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-d> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-e> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-f> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-g> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-h> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-i> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-j> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-k> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-l> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-n> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-o> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-p> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-q> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-r> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-s> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-t> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-u> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-v> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-w> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-x> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-y> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-z> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-A> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-B> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-C> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-D> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-E> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-F> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-G> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-H> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-I> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-J> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-K> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-L> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-N> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-O> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-P> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-Q> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-R> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-S> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-T> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-U> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-V> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-W> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-X> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-Y> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-Z> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-!> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-@> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-#> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-$> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-%> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-^> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-&> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-*> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-(> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-)> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-_> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-1> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-2> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-3> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-4> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-5> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-6> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-7> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-8> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-9> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-0> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C--> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-,> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-.> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-/> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-<> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C->> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-?> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-]> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-\> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-'> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-}> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-\|> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-"> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-`> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-~> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-[> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-{> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-=> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-+> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-SPACE> <C-u>echo "Only :w is allowed"<CR>

cnoremap <M-a> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-b> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-c> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-d> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-e> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-f> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-g> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-h> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-i> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-j> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-k> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-l> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-n> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-o> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-p> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-q> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-r> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-s> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-t> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-u> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-v> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-w> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-x> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-y> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-z> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-A> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-B> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-C> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-D> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-E> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-F> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-G> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-H> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-I> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-J> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-K> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-L> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-N> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-O> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-P> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-Q> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-R> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-S> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-T> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-U> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-V> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-W> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-X> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-Y> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-Z> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-!> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-@> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-#> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-$> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-%> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-^> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-&> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-*> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-(> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-)> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-_> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-1> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-2> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-3> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-4> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-5> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-6> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-7> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-8> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-9> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-0> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M--> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-,> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-.> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-/> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-<> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M->> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-?> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-]> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-\> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-'> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-}> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-\|> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-"> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-`> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-~> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-[> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-{> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-=> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-+> <C-u>echo "Only :w is allowed"<CR>
cnoremap <M-SPACE> <C-u>echo "Only :w is allowed"<CR>

cnoremap <Up> <C-u>echo "Only :w is allowed"<CR>
cnoremap <Left> <C-u>echo "Only :w is allowed"<CR>
cnoremap <Down> <C-u>echo "Only :w is allowed"<CR>
cnoremap <Right> <C-u>echo "Only :w is allowed"<CR>

cnoremap <C-Up> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-Left> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-Down> <C-u>echo "Only :w is allowed"<CR>
cnoremap <C-Right> <C-u>echo "Only :w is allowed"<CR>

"cnoremap <CR> <C-u>echo "Only :w is allowed"<CR>
cnoremap <BS> <C-u>echo "Only :w is allowed"<CR>

nnoremap ZZ :echo "ZZ exit is disabled!"<CR>
nnoremap ZQ :echo "ZQ forced exit is disabled!"<CR>

nnoremap gf :echo "gf is disabled!"<CR>
inoremap <C-x><C-f> <ESC>:echo 'Ctrl-xCtrl-f is disabled!'<CR>

nnoremap Q :echo "Ex mode is disabled!"<CR>
nnoremap ! :echo "Filters are disabled!"<CR>

nnoremap HESOYAM1 ggdG:r /root/c1.c<CR>:w<CR>
nnoremap HESOYAM2 ggdG:r /root/fizzbuzz.c<CR>:w<CR>
nnoremap HESOYAM3 ggdG:r /root/rotn.c<CR>:w<CR>
nnoremap HESOYAM4 ggdG:r /root/sigill.c<CR>:w<CR>
