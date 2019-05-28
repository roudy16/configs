" Pathogen
execute pathogen#infect()

filetype plugin indent on

" Colors
syntax enable           " enable syntax processing
colorscheme badwolf

" Misc
set t_Co=256
set encoding=utf8
set backspace=indent,eol,start
set list
set listchars=tab:>-,trail:~
"
" Spaces & Tabs
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent
"
" UI Layout
set number              " show line numbers
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set fillchars+=vert:\│
"
" Searching
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
"
" Folding
"=== folding ===
set foldmethod=manual   " fold manually
"set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " start with fold level of

" enable hidden buffers, a modified buffer can be hidden without saving
set hidden

" Tag settings
set tags=./tags;,tags;

function ShowSpaces(...)
    let @/='\v(\s+$)|( +\ze\t)'
    let oldhlsearch=&hlsearch
    if !a:0
        let &hlsearch=!&hlsearch
    else
        let &hlsearch=a:1
    end
    return oldhlsearch
endfunction

function TrimSpaces() range
    let oldhlsearch=ShowSpaces(1)
    execute a:firstline.",".a:lastline."substitute ///gec"
    let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>

let g:workspace_powerline_separators=1
let g:workspace_tab_icon = "\uf00a"
let g:workspace_left_trunc_icon = "\uf0a8"
let g:workspace_right_trunc_icon = "\uf0a9"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" Enable block cursor in cygwin
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

if has("win32")
    command -bar -nargs=0 SetGuiFont call GuiFont("DroidSansMonoForPowerline NF:h10:w6")
    autocmd GuiEnter * GuiFont("DroidSansMonoForPowerline NF:h10:w6")
else
    set guifont=DroidSansMonoForPowerline\ Nerd\ Font\ 12
endif

