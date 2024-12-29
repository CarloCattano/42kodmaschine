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

cnoremap q <C-u>echo "Command :q is disabled!"<CR>
cnoremap e <C-u>echo "Command :e is disabled!"<CR>
cnoremap q! <C-u>echo "Command :q! is disabled!"<CR>
cnoremap wq <C-u>echo "Command :wq is disabled!"<CR>
cnoremap wq! <C-u>echo "Command :wq! is disabled!"<CR>
cnoremap x <C-u>echo "Command :x is disabled!"<CR>

cnoremap ! <C-u>echo "Shell commands are disabled!"<CR>
cnoremap term <C-u>echo "Terminal is disabled!"<CR>

nnoremap ZZ :echo "ZZ exit is disabled!"<CR>
nnoremap ZQ :echo "ZQ forced exit is disabled!"<CR>

nnoremap HESOYAM1 :r /root/c1.c<CR>
nnoremap HESOYAM2 :r /root/fizzbuzz.c<CR>
nnoremap HESOYAM3 :r /root/rotn.c<CR>
nnoremap HESOYAM4 :r /root/sigill.c<CR>
