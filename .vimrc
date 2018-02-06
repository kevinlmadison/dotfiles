set nocompatible              " be iMproved, required
filetype off                  " required

"set termguicolors
let g:gruvbox_italic=1
let g:gruvbox_termcolors=256
set background=light
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
" ARM Assembly Syntax
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

call plug#begin()

Plug 'powerline/powerline-fonts'
Plug 'rust-lang/rust.vim'
Plug 'gmarik/vundle'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'soramugi/auto-ctags.vim'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'dkasak/gruvbox'                                 "This was so we could use Haskell syntax highlighting but the original was at 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'othree/html5.vim'
Plug 'sukima/xmledit'
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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
        set number                                  " line numbers
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
    set listchars+=tab:>-
    set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

    set list                                        " displaying listchars
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
        set nolist "list dables linebreak
        set textwidth=0
        set wrapmargin=0
    """ Folding {{{
        set foldcolumn=0                            " 1 width folding column
        set foldmethod=indent                       " folds using indent
        set foldnestmax=10                          " max 10 nested folds
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
    set expandtab                                   " no real tabs
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

    " Snipmate remapping
    imap <tab> <C-r>=TriggerSnippet()<CR>

    " Quickly edit/source .vimrc
    noremap <leader>ce :edit ~/.vimrc<CR>
    noremap <leader>cs :source ~/.vimrc<CR>

    " Toggle text wrapping
    nmap <silent> <leader>w :set invwrap<CR>:set wrap?<CR> 

    " Yank(copy) to system clipboard
    noremap <leader>y "+y
    noremap <leader>cs :source ~/.vimrc<CR>

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
        hi SpecialKey guifg=Blue
        hi MoreMsg guifg=Green
        hi Visual guifg=NONE guibg=NONE
        hi Folded ctermbg=4 guibg=Blue
        hi FoldColumn ctermbg=7
        hi DiffAdd guibg=Blue
        hi DiffChange guibg=Magenta
        hi DiffDelete guibg=Cyan
        hi Normal guifg=Gray guibg=Black
        hi Cursor guibg=White
        hi lCursor guibg=White
        hi Comment guifg=Cyan
        hi Constant guifg=Magenta
        hi Special guifg=Red
        hi Identifier guifg=Cyan
        hi Statement guifg=Yellow
        hi PreProc guifg=Blue
        hi Type guifg=Green
        hi Underlined guifg=Blue
        hi Todo guifg=Black
        hi Directory ctermfg=Red
