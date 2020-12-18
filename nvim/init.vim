source $HOME/.config/nvim/root-settings/splits.vim
source $HOME/.config/nvim/root-settings/plugs.vim
source $HOME/.config/nvim/root-settings/control-c-settings.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/nerdtree.vim
source $HOME/.config/nvim/plug-config/onedark.vim
source $HOME/.config/nvim/plug-config/sneak.vim
source $HOME/.config/nvim/plug-config/quickscope.vim
source $HOME/.config/nvim/plug-config/autopairs.vim
source $HOME/.config/nvim/plug-config/vimcommentary.vim
source $HOME/.config/nvim/plug-config/lightline.vim
source $HOME/.config/nvim/general/keys.vim

" colorscheme bliss 
set termguicolors
set background=dark
" syntax on
colorscheme onedark
" colorscheme gruvbox
" set background=light
" colorscheme solarized
" Gruvbox Theme
" autocmd vimenter * ++nested colorscheme gruvbox

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
" ================ Keyboard bindings ================

" set the leader key to comma
let mapleader = ' '
nmap <leader>b :NERDTreeToggle<CR>

" make the cursor stay on the same character when leaving insert mode
inoremap ć <Esc>l
inoremap Ć <Esc>l

" Mapping U to Redo.
noremap U <c-r>
noremap <c-r> <NOP>

" indent via Tab
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >>_
vnoremap <S-Tab> <<_

syntax on
set encoding=utf-8 
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
set formatoptions=cro
" set cursorline " highlghts the current line
set showtabline=2
set number 
set rnu
set ignorecase
set incsearch
set smartcase
set hlsearch
set lazyredraw
set ttyfast
set ttimeoutlen=10
set history=1000
set clipboard=unnamedplus
set autoread
