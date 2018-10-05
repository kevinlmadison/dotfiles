set nocompatible              " be iMproved, required
set inccommand=nosplit

filetype off                  " required

"set termguicolors
let g:gruvbox_italic=1
let g:gruvbox_termcolors=256
set background=dark
set cursorline
set showtabline=1
let g:gruvbox_contrast_light="soft"
let g:gruvbox_contrast_dark="soft"
" Python Syntax
let g:python_highlight_all = 1
let g:python_version_2 = 0
" Golang syntax
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
" Haskell Syntax
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_backpack = 1
let g:haskell_classic_highlighting = 1
" ARM Assembly Syntax
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7
au BufNewFile,BufRead Jenkinsfile setf groovy " Jenkins uses Groovy syntax
" Use Powerline fonts for Airline Plugin "
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols.linenr = 'Ξ'
let g:airline_theme='gruvbox'
" YouCompleteMe Autocomplete settings
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" Nord theme stuff
let g:nord_cursor_line_number_background = 1

call plug#begin()

"Plug 'vim-syntastic/syntastic'
"Plug 'isRuslan/vim-es6'
Plug 'vim-python/python-syntax'
Plug 'easymotion/vim-easymotion'
Plug 'neovimhaskell/haskell-vim'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'kevinlmadison/auto-pairs', {'branch': 'master'}
Plug 'powerline/powerline-fonts'
Plug 'rust-lang/rust.vim'
Plug 'gmarik/vundle'
"Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --clang-completer --rust-completer --js-completer'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'soramugi/auto-ctags.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'morhetz/gruvbox'
Plug 'dkasak/gruvbox'           "Haskell syntax highlighting
Plug 'arcticicestudio/nord-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'Yggdroot/indentline'
Plug 'othree/html5.vim'
Plug 'sukima/xmledit'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp':'vim/'}
Plug 'ascenator/L9', {'name': 'newL9'}

call plug#end()


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"""let g:syntastic_always_populate_loc_list = 1
"""let g:syntastic_auto_loc_list = 1
"""let g:syntastic_check_on_open = 1
"""let g:syntastic_check_on_wq = 0
"""let g:syntastic_javascript_checkers=['eslint', 'babel-eslint']

let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git']


""" User interface {{{
    """ Syntax highlighting {{{
        filetype plugin on
        filetype plugin indent on                   " enable ft+plugin detect
        syntax on                                   " syntax highlighting
        set t_Co=256                                " 256-colors
        colorscheme gruvbox
        """ highlight Normal ctermbg=NONE               " use terminal background
        """ hi VertSplit ctermfg=Black ctermbg=Yellow gui=NONE
        """ highlight nonText ctermbg=NONE              " use terminal background
        au BufRead,BufNewFile *.txt set ft=sh       " opens .txt w/highlight
        """ Highlight characters past 80 {{{
            augroup vimrc_autocmds
                autocmd BufEnter * highlight OverLength ctermbg=black guibg=#292929
                autocmd BufEnter * match OverLength /\%160v.*/
            augroup END
        """ }}}
    """ }}}
    """ Interface general {{{
        set encoding=utf-8                          " For Powerline glyphs
        set more                                    " ---more--- like less
        set noshowmode                              " hide mode in cmd-line
        set number relativenumber                                 " line numbers
        set showcmd                                 " show cmds being typed
        set title                                   " window title
        set visualbell                              " visual instead of beep
        set wildignore=.bak,.pyc,.o,.ojb,.,a,       " ignore said files
                       \.pdf,.jpg,.gif,.png,
                       \.avi,.mkv,.so
        set wildmenu                                " better cmd-completion
        set wildmode=list:longest                   " wildmode huge list


        """ Powerline {{{
            let g:Powerline_symbols = 'fancy'       " enable PL-glyphs
        """ }}}
    """ }}}
""" }}}
""" General settings {{{
    set hidden                                      " buffer change, more undo
    set history=40                                  " default 20
    set iskeyword+=_,$,@,%,#                        " not word dividers
    set laststatus=2                                " always show statusline
    """set listchars=tab:>\                            " > to highlight <tab>>
    set list                                        " displaying listchars
    set listchars=
    ""set listchars+=tab:→
    set listchars+=tab:>-
    set listchars+=precedes:⟨
    set listchars+=extends:⟩
    set listchars+=trail:¬
    "set listchars=tab:→\ ,eol:¬,nbsp:␣,trail:¬,extends:⟩,precedes:⟨

    set mouse=a                                     " mouse in all modes
    if !has('nvim')
        set ttymouse=xterm2
    endif
    set nocompatible                                " don't vi-compatible
    set noexrc                                      " don't use other .*rc(s)
    set nostartofline                               " no goto #1 char in line
    set nowrap                                      " don't wrap lines
    set numberwidth=5                               " 99999 lines
    " Allows writing to files with root priviledges
     cmap w!! w !sudo tee % > /dev/null
    
    """ Wordwrap {{{
        set wrap
        set linebreak
        """set nolist "list dables linebreak
        set textwidth=0
        set wrapmargin=0
    """ Folding {{{
        set foldcolumn=0                            " 1 width folding column
        set foldmethod=indent                       " folds using indent
        autocmd BufWinEnter * silent!:%foldopen!
        set foldnestmax=3                          " max 10 nested folds
        set nofoldenable                            " all folds open default
    """ }}}
    """ Search and replace {{{
        set gdefault                                " default s//g
        set incsearch                               " "live"-search
        set ignorecase                              " case insensitive search
    """ }}}
    """ Matching {{{
        set matchtime=2                             " time to blink match {}
        set showmatch                               " tmp-jump to match-bracket
    """ }}}
""" }}}
""" Files {{{
    set autochdir                                   " always use curr. dir.
    set autoread                                    " refresh if changed
    set backup                                      " backup curr file
    set backupdir=~/.vim/backup,/tmp                " backup director{y,ies}
    set directory=~/.vim/backup,/tmp
    set backupext=~                                 " append ~ to backups
    set confirm                                     " confirm changed files
    set noautowrite                                 " never autowrite
    set updatecount=50                              " update swp after 50chars
    set undolevels=100                             " max undo's
    set runtimepath^=~/.vim/bundle/ctrlp.vim
""" }}}
""" Text formatting {{{
    set autoindent                                  " preserve indentation
    set backspace=indent,eol,start                  " smart backspace
    set expandtab                                 " no real tabs
    set shiftround                                  " be clever with tabs
    set shiftwidth=4                                " default 8
    set smartcase                                   " igncase,except w/capitals
    set smartindent                                 " see autoindent
    set smarttab                                    " tab to 0,4,8 etc.
    set softtabstop=4                               " "tab" feels like <tab>
    set tabstop=4                                   " replace <TAB> w/4 spaces
    """inoremap { {}<Esc>i
    """inoremap [ []<Esc>i
    """inoremap ( ()<Esc>i
    
""" }}}
""" Keybindings {{{
    " Remap <leader>
    let mapleader=","

    noremap <CR> G

    " FuzzyFinder - buffer mode
    nmap <F1> <nop>

    " Open the plugin NERDTree
    noremap <F2> :NERDTreeToggle<CR>

    nmap <Leader>t :Tags<CR>
    nmap <Leader>b :Buffers<CR>
    nnoremap <c-p> :Files<CR>

    " Toggle buffer selection/tag lists
    map <F3> <ESC>:TagbarToggle<CR>
    nmap <leader>T :enew<cr>
    nmap <leader>l :bnext<cr>
    nmap <leader>h :bprevious<cr>

    " Snipmate remapping
    "imap <tab> <C-r>=TriggerSnippet()<CR>

    " Quickly edit/source .vimrc
    noremap <leader>ce :edit ~/.vimrc<CR>
    noremap <leader>cs :source ~/.vimrc<CR>

    " Toggle text wrapping
    "nmap <silent> <leader>w :set invwrap<CR>:set wrap?<CR> 
    " Wrapping macros
    nmap <leader>w ysiw
    nmap <leader>cw cs
    nmap <leader>dw ds

    " Yank(copy) to system clipboard
    noremap <leader>y "+y
    noremap <leader>p "+p
    noremap <leader>n :noh<CR>

    " Commenting with # or remove for multiple languages
    vnoremap <leader>; :s/^/#/<CR>:noh<CR>
    vnoremap <leader>: :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>"]


    """ Folding {{{
        nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
        vnoremap <Space> zf
    """ }}}
    """ Bubbling (bracket matching) {{{
        nmap <C-up> [e
        nmap <C-down> ]e
        vmap <C-up> [egv
        vmap <C-down> ]egv
    """ }}}
    """ Pasting {{{
        "set paste
        nnoremap p ]p
        """nnoremap <C-p> p
"" }}}

        let TList_Ctags_cmd = 'ctags'
    """ GVIM COLORS
    "    hi SpecialKey guifg=Blue
    "    hi MoreMsg guifg=Green
    "    hi Visual guifg=NONE guibg=NONE
    "    hi Folded ctermbg=4 guibg=Blue
    "    hi FoldColumn ctermbg=7
    "    hi DiffAdd guibg=Blue
    "    hi DiffChange guibg=Magenta
    "    hi DiffDelete guibg=Cyan
    "    hi Normal guifg=Gray guibg=Black
    "    hi Cursor guibg=White
    "    hi lCursor guibg=White
    "    hi Comment guifg=Cyan
    "    hi Constant guifg=Magenta
    "    hi Special guifg=Red
    "    hi Identifier guifg=Cyan
    "    hi Statement guifg=Yellow
    "    hi PreProc guifg=Blue
    "    hi Type guifg=Green
    "    hi Underlined guifg=Blue
    "    hi Todo guifg=Black
    "    hi Directory ctermfg=Red
