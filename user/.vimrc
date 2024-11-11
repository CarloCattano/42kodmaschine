syntax on
syntax enable
set noswapfile
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

cnoremap q <C-u>echo "Command :q is disabled!"<CR>
cnoremap q! <C-u>echo "Command :q! is disabled!"<CR>
cnoremap wq <C-u>echo "Command :wq is disabled!"<CR>
cnoremap wq! <C-u>echo "Command :wq! is disabled!"<CR>
cnoremap x <C-u>echo "Command :x is disabled!"<CR>

cnoremap ! <C-u>echo "Shell commands are disabled!"<CR>
cnoremap term <C-u>echo "Terminal is disabled!"<CR>

nnoremap ZZ :echo "ZZ exit is disabled!"<CR>
nnoremap ZQ :echo "ZQ forced exit is disabled!"<CR>
