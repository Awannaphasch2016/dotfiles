syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set relativenumber

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" set font = Monaco:h20

imap jk <Esc> 
vmap jk <Esc> 

" yank will copy to clipboard
autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' |  clip.exe')

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
" Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
" Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'git@github.com:nvie/vim-flake8.git'
Plug 'git@github.com:easymotion/vim-easymotion'
Plug 'git@github.com:preservim/tagbar'
Plug 'git@github.com:tpope/vim-surround'
Plug 'git@github.com:tpope/vim-commentary'
" Plug 'powerline/powerline'
"Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', {'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'lfv89/vim-interestingwords'
" Plug 'liuchengxu/vim-which-key'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'mattn/webapi-vim'
" Plug 'mattn/gist-vim'
Plug 'vimwiki/vimwiki'
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'

call plug#end()

colorscheme gruvbox
set background=dark

" " allow rg to alwasy detect your root.
" if executable('rg')
"     let g:rg_derive_root
" endif

let mapleader = " "

" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-
"let g:netrw_brwse_split=2
"let g:netrw_banner = 0
"let g:ctrlp_use_caching = 0

nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>U :UndotreeShow<CR>
nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" :Rg command not found.
" nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR> 
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" I couldn't test below because I haven't install Ycm yet.
" version
" nmap <Leader>gd <Plug>(coc-definition)
" nmap <Leader>gr <Plug>(coc-references)
" nnoremap <C-p> :GFiles<CR>

" easymotion 
" map <Leader>s <Plug>(easymotion-s)
nmap <Leader>F <Plug>(easymotion-overwin-f2)
nmap <Leader>f <Plug>(easymotion-bd-f2)

" fzf 
nmap <Leader>. :Files<cr>

" tab management
nmap <tab> gt
nmap <S-tab> gT
nmap tn :tabnew<Space>
nmap tt :tabedit<Space>

nmap tk :tabnext<CR>
nmap tj :tabprev<CR>

nmap th :tabfirst<CR>
nmap tl :tablast<CR>


" %bd close all the buffer, e# open last edited file, bd# close the unnamed
" buffer
nnoremap <leader>ca :w <bar> %bd <bar> e# <bar> <Cr>
" tagbar | code structure
nmap <Leader>T :TagbarToggle<CR>
nmap <Leader>t :TagbarOpenAutoClose<CR>

" Plugin/interestingWords
let g:interestingWordsDefaultMappings = 0
nnoremap <silent> <leader>' :call InterestingWords('n')<cr>
vnoremap <silent> <leader>' :call InterestingWords('v')<cr>
nnoremap <silent> <leader>" :call UncolorAllWords()<cr>

nnoremap <silent> n :call WordNavigation(1)<cr>
nnoremap <silent> N :call WordNavigation(0)<cr>

" Mode dependent Cursor 
" replace the number after \e[
" Ps = 0  -> blinking block
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" move line up/down
" nnoremap <a-j> :m .+1<cr>==
" nnoremap <a-k> :m .-2<cr>==
" inoremap <a-j> <esc>:m .+1<cr>==gi
" inoremap <a-j> <esc>:m .+1<cr>==gi
" inoremap <a-k> <esc>:m .-2<cr>==gi
" vnoremap <a-j> :m '>+1<cr>gv=gv
" vnoremap <a-k> :m '<-2<cr>gv=gv

" enable visual block
nnoremap q <c-v>

" Plugin/stratify
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

"  don't have any bookmarks yet

" let g:startify_bookmarks = [
"             \ { 'c': '~/.config/i3/config' },
"             \ { 'i': '~/.config/nvim/init.vim' },
"             \ { 'z': '~/.zshrc' },
"             \ '~/Blog',
"             \ '~/Code',
"             \ '~/Pics',
"             \ ]

nmap <Leader>b :buffers<CR>:buffer<Space>

" script to create file in /ScratchFiles folder
function! Hex()
    " let str=a:var1
    " echo str
    return "something"
endfunction
