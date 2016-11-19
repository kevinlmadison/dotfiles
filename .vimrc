set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line:
execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
""" Vundle plugin manager {{{
    filetype off                                    " required to init 
    set rtp+=~/.vim/bundle/vundle/                  " include vundle
    call vundle#rc()                                " init vundle
    """ github repos {{{
        Bundle 'gmarik/vundle'
        Bundle 'ervandew/supertab'
        """Bundle 'Valloric/YouCompleteMe'
        Bundle 'bling/vim-airline'
        Bundle 'scrooloose/nerdtree'
        Bundle 'tpope/vim-surround'
        Bundle 'majutsushi/tagbar'
        Bundle 'octol/vim-cpp-enhanced-highlight'
        Bundle 'MarcWeber/vim-addon-mw-utils'
        Bundle 'tomtom/tlib_vim'
        Bundle 'garbas/vim-snipmate'
        Bundle 'othree/html5.vim'
        Bundle 'chriskempson/base16-vim'
        Bundle 'sukima/xmledit'
       " Bundle 'vim-scripts/simple-pairs'
        Bundle 'autoclose/autoclose'
        Bundle 'tmhedberg/SimpylFold'
""" }}}
""" User interface {{{
    """ Syntax highlighting {{{
        filetype plugin on
        filetype plugin indent on                   " enable ft+plugin detect
        syntax on                                   " syntax highlighting
        set t_Co=256                                " 256-colors
        colors slate
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
    set listchars=tab:>\                            " > to highlight <tab>>
    set list                                        " displaying listchars
    set mouse=a                                     " mouse in all modes
    set ttymouse=xterm2
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
        nnoremap <C-p> p
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
