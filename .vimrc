" START VUNDLE

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'kien/ctrlp.vim'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
" Plugin 'godoctor/godoctor.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'moll/vim-bbye'
Plugin 'vim-scripts/repmo.vim'
Plugin 'hjson/vim-hjson'
Plugin 'leafgarland/typescript-vim'
" Plugin 'mdempsky/gocode', {'rtp': 'vim/'}
" Plugin 'shougo/deoplete.nvim'
" Plugin 'roxma/nvim-yarp'
" Plugin 'roxma/vim-hug-neovim-rpc'

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
" Put your non-Plugin stuff after this line

" END VUNDLE


" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
"set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
"filetype indent plugin on

" Enable syntax highlighting
syntax on

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window for multiple buffers, and/or:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
"set ignorecase
"set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
" set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
"set cmdheight=2

" Display line numbers on the left
"set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

set noswapfile

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
set tabstop=2

" Avoid bold keywords in code.
set t_md=

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
"map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

set background=dark
set t_Co=256
set statusline&
hi statusline ctermfg=25 ctermbg=231
au InsertEnter * hi statusline ctermfg=34 ctermbg=231
au InsertLeave * hi statusline ctermfg=25 ctermbg=231

set autoread
" Trigger autoread when changing buffers.
au BufEnter * :silent! !
" Save the session every time a file is saved
" autocmd BufWritePre * mksession! ~/Session.vim

let mapleader = ","
nnoremap <Leader>w <C-W>

command! FormatJson silent %!python -c "import json, sys, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), indent=2)"
command! MyMake silent make! | copen | redraw!
nnoremap <Leader>mk :MyMake <CR>

command! -nargs=1 GoToRuneIndex :call cursor(1, 1) | :call search('\%^\_.\{' . (<q-args> + 0) . '}', 'e')
nnoremap <Leader>gc :GoToRuneIndex 

" Single quotes must be typed twice in the search string. Example:
" popup(''skuld'')
command! -nargs=1 GrepInFiles execute 'silent lgrep! <q-args> . -FRIn --exclude-dir={.git,.svn,bower_components,node_modules,Godeps,compiled,assembled,vendor,fonts,.next} --exclude=*{sv-SE.po,en-GB.js,en-SE.js,sv-SE.js,zu-ZA.js,en-SE_general_source.js,*.min.js,*.min.css}' | lopen | redraw!

nnoremap <Leader>gr :GrepInFiles 
nnoremap <Leader>gy :GrepInFiles <C-R>"<CR>

nnoremap gr :GoReferrers<CR> :copen<CR>

nnoremap <silent> <C-N> :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let g:NERDTreeNotificationThreshold = 500

nnoremap <Leader>q :Bdelete<CR>
let g:buffergator_viewport_split_policy = "T"
let g:buffergator_show_full_directory_path = 0

let g:ctrlp_working_path_mode = '0'
let g:ctrlp_by_filename = 0
let g:ctrlp_regexp = 1

let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go', 'c', 'h', 'cpp', 'hpp', 'html', 'php'] }

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_always_populate_loc_list = 1

" add go vim plugins
set rtp+=$GOROOT/misc/vim

" call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" let g:deoplete#enable_at_startup = 1
let g:go_fmt_command = "gofmt"
let g:go_imports_mode = 'goimports'
let g:go_fmt_autosave = 1
let g:go_imports_autosave = 0
let g:go_list_type = "quickfix"

nnoremap <Leader>r :GoBuild<CR>
nnoremap <Leader>gi :GoImports<CR>

if has("conceal")
  " do not hide double quotes in JSON files
  autocmd FileType json setlocal conceallevel=0
endif
