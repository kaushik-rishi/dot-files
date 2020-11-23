"tabe"
call plug#begin('~/.config/nvim/plugged')

" Plug 'dense-analysis/ale'

" light line
Plug 'itchyny/lightline.vim'

" coc completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" nerd tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" surround vim
Plug 'tpope/vim-surround'

" vim comments
Plug 'tpope/vim-commentary'

" nerd commenter
" Plug 'scrooloose/nerdcommenter'

" dev icons
Plug 'ryanoasis/vim-devicons'

" Nerd Tree syntax highlighting
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" UltiSnips
" Plug 'SirVer/ultisnips'


" easy motion
Plug 'easymotion/vim-easymotion'

" multi cursor
Plug 'mg979/vim-visual-multi'

" colorscheme
" Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'

" ctrl.p
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files

call plug#end()		

" split navigation
set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" =============== Light Line Plugin configuration ==================
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active' : {
      \ 'right' : []
      \},
      \ }

" By the way, -- INSERT -- is unnecessary anymore because the mode information is displayed in the statusline.
set noshowmode

" ==================================================================

" ================ Suggestions ======================
 
" show wild menu (menu of suggestions) when typing commands in command mode
set path+=**
set wildmenu
set showcmd

" ================ File management ==================
 
" Turn off swap files
set noswapfile
set nobackup
set nowb
set mouse=a
set colorcolumn=+1
 
" TODO: improve behaviour
" reload files changed outside vim
set autoread
" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" ================ Srolling =========================

" Start scrolling when we're 8 lines away from margins
set scrolloff=8
:autocmd BufNewFile  *.cpp 0r ~/.config/nvim/template.cpp

" ================ Encoding =========================

"set encoding to utf8
if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif

" ================ Keyboard bindings ================

" set the leader key to comma
let mapleader = ','

" clipboard
" copy
" noremap <C-c> "+y
" paste
" noremap <C-v> "+p
" cut
" noremap <C-x> "+d
" paste in insert mode
" inoremap <C-v> <Esc>"+pa

" make the cursor stay on the same character when leaving insert mode
inoremap ć <Esc>l
inoremap Ć <Esc>l

" fast scrolling
nnoremap K 10j
nnoremap L 10k
vnoremap K 10j
vnoremap L 10k

" Mapping U to Redo.
noremap U <c-r>
noremap <c-r> <NOP>

" indent via Tab
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >>_
vnoremap <S-Tab> <<_

" ================ Visualization ====================
 
syntax on
set background=dark
colorscheme hybrid

" enable 256bit colors - also: override gnome-terminal's settings
set t_Co=256


" ================ Indentation ======================

set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab
set nojoinspaces
set showmatch                           " Display matching brackets
set mat=2                               " Blink when matching brackets
set noerrorbells                        " Turn off error bell sounds
set novisualbell                        " Turn off bell sounds
set t_vb=                               " Disable beeping
set tm=500 


" ================ Number column ====================
 
" numbers
set number " see the line number column
set rnu

" Toggle relative numbering, and set to absolute on loss of focus or insert mode
" autocmd InsertEnter * :set nornu
" autocmd InsertLeave * :set rnu

" ================ Searching ========================

" Ignorecase when searching
set ignorecase

" incremental search - Vim starts searching when we start typing
set incsearch

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" toggle search highlighting
nnoremap <F3> :set hlsearch!<CR>


" ================ Performance ======================

" fix slow scrolling that occurs when using mouse and relative numbers
set lazyredraw
" vim timeout (forgot why I need this or if I do at all)
set ttyfast
set ttimeoutlen=10

" ================ Misc =============================

" highlight matching braces
" set showmatch

" How many tenths of a second to blink when matching brackets
set mat=10

" When the last window will have a status line (2 = always)
set laststatus=2

" disable wrapping of long lines into multiple lines
set wrap linebreak nolist

" history
set history=1000

" on some systems the backspace does not work as expected.
" this fixes the problem
set backspace=indent,eol,start

" to avoid hitting:
" 'press ENTER or type command to continue'
" add 'silent' keyword before the command
" 
" open a gnome-terminal with a shortcut
noremap <leader><CR> :silent !gnome-terminal<CR>

"disable preview window
set completeopt-=preview


" ================ Plugins ==========================
" ################ NERDTree #########################
 
" shift+i (show hidden files)
" ctrl+b open/closes nerd tree
 
noremap <C-e> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
inoremap " ""<left>
inoremap ' ''<left>
" inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" quit nerd tree on file open
let g:NERDTreeQuitOnOpen = 0

" show nerd tree always on the right instead on the left
let g:NERDTreeWinPos = "right"

" ################ UltiSnips ########################

" make a dir Ultisnips in: '~/.config/nvim/UltiSnips/'
" and put your snippets in there
" eg. cpp.snippets

" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" let g:UltiSnipsUsePythonVersion = 3

" integrating with the system clipboard
set clipboard=unnamedplus

" sourcing the configuration file coc.vim
source $HOME/.config/nvim/plug-config/coc.vim

" vim-commentary keybindings
" press / to comment and in visual mode select the required lines and then press
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

