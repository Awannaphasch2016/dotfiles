syntax on
"
" General Settings
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-
"let g:netrw_brwse_split=2
" set updatetime=101
set ttimeoutlen=100
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
set autoread
set clipboard=unnamedplus
set mouse+=a
set ttymouse=xterm2 " allow resize vim window with mouse
set hlsearch
set ic  " search not case sensitive
set equalalways
" set autochdir
nnoremap <Space>wo  :tab split<CR>

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" set font = Monaco:h20

" Prevent x from overriding what's in the clipboard
noremap x "_x
noremap X "_X



call plug#begin('~/.vim/plugged')

" Plug 'airblade/vim-gitgutter'
" Plug 'KKPMW/vim-sendtowindow'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'git@github.com:nvie/vim-flake8.git'
Plug 'git@github.com:easymotion/vim-easymotion'
Plug 'git@github.com:preservim/tagbar'
Plug 'git@github.com:tpope/vim-surround'
Plug 'git@github.com:tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/fzf', {'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'lfv89/vim-interestingwords'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mhinz/vim-startify'
Plug 'mattn/webapi-vim'
Plug 'fisadev/vim-isort'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'  " useful snippets.
Plug 'jupyter-vim/jupyter-vim'
Plug 'nelstrom/vim-visual-star-search' " allow using * under hightlighted curosr.
Plug 'mhinz/vim-grepper'
Plug 'rhysd/vim-healthcheck'
Plug 'lambdalisue/fern.vim' " start up vim is super slow
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'vifm/vifm.vim'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'davidhalter/jedi-vim'
Plug 'dhruvasagar/vim-zoom'
Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'ervandew/supertab'
Plug 'dbakker/vim-projectroot'
" Plug 'airblade/vim-rooter'

" Plug 'tmux-plugins/tmux-resurrect'
" Plug 'fannheyward/coc-pyright'
" Plug 'vimwiki/vimwiki'
" Plug 'haya14busa/is.vim'
" Plug 'git@github.com:kien/ctrlp.vim.git'
" Plug 'https://github.com/williamjameshandley/vimteractive'
" Plug 'jpalardy/vim-slime', { 'for': 'python' }
" Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
" Plug 'karoliskoncevicius/vim-sendtowindow'
" Plug 'iamcco/markdown-preview.vim'
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
" Plug 'jremmen/vim-ripgrep'
" Plug 'mattn/gist-vim'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-airline/vim-airline'
" Plug 'liuchengxu/vim-which-key'
" Plug 'powerline/powerline'
" Plug 'lyuts/vim-rtags'

call plug#end()

colorscheme gruvbox
set background=dark

" allow rg to alwasy detect your root.
if executable('Rg')
    let g:Rg_derive_root
endif

let mapleader = " "
let maplocalleader = "''"

" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-
"let g:netrw_brwse_split=2
"let g:netrw_banner = 0
"let g:ctrlp_use_caching = 0


" nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR> 
nnoremap <silent> <Leader>- :vertical resize -5<CR>


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
"==========================
"=== Plugin/stratify
"==========================
let g:startify_session_dir = '~/.vim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_bookmarks = [
            \ { 'w': '~/Documents/Working' },
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

"Plugin/gitgutter
let g:gitgutter_async=0


" script to create file in /ScratchFiles folder
function! Hex()
    " let str=a:var1
    " echo str
    return "something"
endfunction

" " Plugin/sendtosplit
" source /home/awannaphasch2016/vim-sendtowindow/plugin/sendtosplit.vim

" let g:sendtowindow_use_defaults=0
" nmap L <Plug>SendRight
" xmap L <Plug>SendRightV
" nmap H <Plug>SendLeft
" xmap H <Plug>SendLeftV
" nmap K <Plug>SendUp
" xmap K <Plug>SendUpV
" nmap J <Plug>SendDown
" xmap J <Plug>SendDownV

nnoremap <Leader>v :vsplit <CR>
nnoremap <Leader>s :split <CR>
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>U :UndotreeShow<CR>
nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" nmap <silent> <C-Left> :vertical resize +3<CR>
" nmap <silent> <C-Right> :vertical resize -3<CR>
" nmap <silent> <C-Up> :resize +3<CR>
" nmap <silent> <C-Down> :resize +3<CR>

nmap rp :w<CR>:!python3 %<CR>
nmap rt :w<CR>:!time python3 %<CR>

""" Plugin/viminteractive
"let g:vimteractive_default_shells = { 'python': 'ipython' }
"let g:vimteractive_bracketed_paste_default = 0
"let g:vimteractive_vertical = 1        " Vertically split terminals
"let g:vimteractive_autostart = 0       " Don't start terminals by default

""" " Plugin/vim-slime
"" let g:slime_target = "tmux"
"" let g:slime_paste_file = "$HOME/.slime_paste"
"" let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

"""------------------------------------------------------------------------------
"""" slime configuration 
"""------------------------------------------------------------------------------
"""" always use tmux
"let g:slime_target = 'tmux'

""" fix paste issues in ipython
"let g:slime_python_ipython = 1

" " always send text to the top-right pane in the current tmux tab without asking
" let g:slime_default_config = {
"     \ 'socket_name': get(split($TMUX, ','), 0),
"     \ 'target_pane': '{top-right}' }
" let g:slime_dont_ask_default = 1

"""------------------------------------------------------------------------------
""" ipython-cell configuration
"""------------------------------------------------------------------------------
""" Keyboard mappings. <Leader> is \ (backslash) by default
""" map <Leader>s to start IPython
"nnoremap <Leader>s :SlimeSend1 python3 -m ipython <CR>
""" map <Leader>r to run script
"nnoremap <Leader>r :IPythonCellRun<CR>
""" map <Leader>R to run script and time the execution
"nnoremap <Leader>R :IPythonCellRunTime<CR>
""" map <Leader>c to execute the current cell
"nnoremap <Leader>c :IPythonCellExecuteCell<CR>
""" map <Leader>C to execute the current cell and jump to the next cell
"nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>
""" map <Leader>l to clear IPython screen
"nnoremap <Leader>l :IPythonCellClear<CR>
""" map <Leader>x to close all Matplotlib figure windows
"nnoremap <Leader>x :IPythonCellClose<CR>
""" map [c and ]c to jump to the previous and next cell header
"nnoremap [c :IPythonCellPrevCell<CR>
"nnoremap ]c :IPythonCellNextCell<CR>
""" map <Leader>h to send the current line or current selection to IPython
"nmap <Leader>h <Plug>SlimeLineSend
"xmap <Leader>h <Plug>SlimeRegionSend
""" map <Leader>p to run the previous command
"nnoremap <Leader>p :IPythonCellPrevCommand<CR>
""" map <Leader>Q to restart ipython
"nnoremap <Leader>Q :IPythonCellRestart<CR>
""" map <Leader>d to start debug mode
"nnoremap <Leader>d :SlimeSend1 %debug<CR>
""" map <Leader>q to exit debug mode or IPython
""nnoremap <Leader>q :SlimeSend1 exit<CR>

" Plugin/jupyter-vim
" Run current file
nnoremap <buffer> <silent> <localleader>R :JupyterRunFile<CR>
nnoremap <buffer> <silent> <localleader>I :PythonImportThisFile<CR>

" Change to directory of current file
nnoremap <buffer> <silent> <localleader>d :JupyterCd %:p:h<CR>

" Send a selection of lines
nnoremap <buffer> <silent> <localleader>X :JupyterSendCell<CR>
nnoremap <buffer> <silent> <localleader>E :JupyterSendRange<CR>
nmap     <buffer> <silent> <localleader>e <Plug>JupyterRunTextObj
vmap     <buffer> <silent> <localleader>e <Plug>JupyterRunVisual

nnoremap <buffer> <silent> <localleader>U :JupyterUpdateShell<CR>

" Debugging maps
nnoremap <buffer> <silent> <localleader>b :PythonSetBreak<CR>


" copy and paste using clipboard
set pastetoggle=<F10> 
" map p :set paste<CR>p:set nopaste<CR>

" not sure which plugin overwrite but I need to remap
nmap <c-i> <c-i>
" ==============================================
" ==Plugin/ultisnips and Plugin/vim-snippets
" ==============================================
" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>" 
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsSnippetsDir = $HOME.'/.vim/UltiSnips'
" let g:UltiSnipsExpandTrigger = '<tab>' " tab trigger doesn't work
" let g:UltiSnipsJumpForwardTrigger = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


" Plugin/NERDTree
let NERDTreeIgnore = ['\.pyc$']
" nnoremap <C-t> :NERDTreeToggle<CR>
" Open nerd tree at the current file on close nerd tree is pressed again.
nnoremap <silent> <expr> <c-t> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
" auto load buffer when file is renamed
let g:NERDTreeAutoDeleteBuffer=1  


" there is a bug that required me to always type :imap jk <Esc> for vim to
" work correctly
nmap <Leader>b :buffers<CR>:buffer<Space>
" nmap <Leader>, :imap jk <Esc> <CR>
imap jk <Esc>


" ============================
" =======Search and Replace
" ============================
" find and replace all in a file
nnoremap <Leader>r : %s//g<Left><Left>
" Note: code below is untested during actual coding session
noremap <Leader>ar
    \ :let @s=expand('<cword>')<CR>
    \ :Grepper -cword -noprompt<CR>
    \ :cfdo %s/<C-r>s// \| update
"    \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" equivalent of replacing instances with multiple curosr
" nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
" xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" =========================
" == Plugin/FZf
" =========================
" set up root of a project as a folder that contain .git
function! s:find_git_root()
      return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

" nnoremap <silent> <C-p> :FZF -m<CR>
nnoremap <silent> <C-p> :ProjectFiles <CR>
nnoremap <silent> <Leader>L :Lines<CR>
" nnoremap <silent> <Leader>b :BLines<CR>
nnoremap <silent> <Leader><Enter> :Buffers<CR>


" allow lines and Blines to show preview
" ref: https://github.com/junegunn/fzf.vim/issues/374
" version 1
command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --no-sort'}, 'up:50%', '?'),
    \   1)
nnoremap H :LinesWithPreview<CR>
" version 2 
" command! -bang -nargs=* CustomBLines
"     \ call fzf#vim#grep(
"     \   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
"     \   fzf#vim#with_preview({'options': '--keep-right --delimiter : --nth 4.. --preview "bat -p --color always {}"'}, 'right:60%' ))
" nnoremap <leader>/ :CustomBLines<Cr>


" =========================
" == Plugin/vim-session
" =========================
let g:session_directory ="~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "yes"
" let g:session_menu = 1
let g:session_command_aliases = 1
nnoremap <leader>ao :OpenSession
nnoremap <leader>as :SaveSession
nnoremap <leader>ad :DeleteSession
nnoremap <leader>ac :CloseSession

" =========================
" == Plugin/vim-isort
" =========================
let g:vim_isort_map = '<C-i>'

" =========================
" == copy to clipboard
" =========================
" yank will copy to clipboard
autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' |  clip.exe')

" " Convert slashes to backslashes for Windows.
" " paragraph below only work for linux 
" nmap ,cs :let @*=expand("%")<CR>
" nmap ,cl :let @*=expand("%:p")<CR>

" ======================
" == Plugin/vimspector
" ======================
fun! GotoWindow(id)
call win_gotoid(a:id)
    MaximizerToggle
endfun

let g:vimspector_enable_mappings = 'HUMAN'
"  Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" <Plug>VimspectorStop
" <Plug>VimspectorPause
" <Plug>VimspectorAddFunctionBreakpoint

" ======================
" == Automatically install missing Plugins on start up (
" haven't tested)
" ======================
autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif

" ======================
" == Use K to show documentation in preview window.
" ======================

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" " nmap <Leader>gd <Plug>(coc-definition)
" nmap <Leader>gd :call CocActionAsync('jumpDefinition')<CR>
" nmap <Leader>gr <Plug>(coc-references)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition) " not working
" nmap <silent> gi <Plug>(coc-implementation) " not working
" nmap <silent> gr <Plug>(coc-references) " not working


" " ======================
" " == seting fold for python
" " ======================
" " zo - opens folds
" " zc - closes fold
" " zm - increases auto fold depth
" " zr - reduces auto fold depth
" set foldmethod=indent
" set foldlevel=1
" set foldclose=all


" ======================
" == seting fold for python
" ======================
" unmap <leader>s because it overwrite intended map of <leader>s when open
" python file
let g:jedi#goto_stubs_command = "<C-C>s" 


" ======================
" == set statusline 
" ======================

" set statusline+=%F

" " ======================
" " == Vim Rooter
" can't get it to work
" " ======================
" let g:rooter_targets = '/,*.py'
" let g:rooter_patterns = ['=src']
" let g:rooter_patterns = ['.git', '.venv']

