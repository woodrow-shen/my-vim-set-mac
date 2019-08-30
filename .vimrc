syntax on
" be iMproved, required
set nocompatible
" required
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin on GitHub repo
" Tabnine can NOT co-exist with YCM, so tabnine is used by default
Plugin 'zxqfl/tabnine-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'elzr/vim-json'
Plugin 'plasticboy/vim-markdown'
Plugin 'sjl/gundo.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'will133/vim-dirdiff'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'fatih/vim-go'
Plugin 'peterhoeg/vim-qml'

" Git plugin not hosted on GitHub
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'git://github.com/godlygeek/tabular.git'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set t_Co=256
" Show (partial) command in status line.
set showcmd
set hid
set nosol
set ls=2
set ai
set cindent
set autoindent
set smartindent
set showmatch
set cinoptions=:0.5s,=0.5s
" Disable annoying beeping
set noeb
set vb t_vb=
set tabpagemax=16
set hlsearch
set autowrite
" For common use
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
" For linux kernel
"set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
" Folding settings
set foldmethod=indent "fold based on indent
set foldnestmax=10 "deepest fold is 10 levels
set nofoldenable "disable folding by default
set foldlevel=1
set backspace=indent,eol,start
set cursorline
set nu
" 設定自動轉換為 UTF-8 編碼
" set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set fileencodings=big5,utf-8,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set encoding=utf8
set tenc=utf8

" Set color scheme
colorscheme my_color_style

" Plugin configurations
let g:DirDiffExcludes = ".svn,*.class,*.exe,.*.swp"
let c_hi_identifiers	= 'all'
let c_hi_libs	 = ['*']

" Setup taglist
Bundle 'taglist.vim'

let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Inc_Winwidth=0
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Show_Menu=1
" let Tlist_Use_Right_Window=1

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostics_ui = 0

" Setup syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" Map taglist
nmap <silent> <F1> :Tlist <cr>
nmap <silent> <F2> :TlistOpen <cr>
nmap <silent> <F3> :q <cr>
nmap <silent> <F4> \be
nmap <silent> <F5> :NERDTree <cr>
nmap <silent> <F6> :lclose <cr>
nmap <silent> <F7> :Errors <cr>
nmap <silent> <C-N><C-N> :set nu!<cr>

"au InsertLeave * hi ModeMsg ctermfg=black ctermbg=yellow gui=undercurl guisp=Magenta
"au InsertEnter * hi ModeMsg ctermfg=black ctermbg=grey
hi Visual ctermfg=brown ctermbg=gray gui=bold guifg=brown guibg=gray

" Tabularize
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
	let p = '^\s*|\s.*\s|\s*$'
	if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
	let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
	let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
	Tabularize/|/l1
	normal! 0
	call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
	endif
endfunction

nmap a= :Tabularize/=<CR>
vmap a= :Tabularize/=<CR>
nmap a: :Tabularize/:\zs<CR>
vmap a: :Tabularize/:\zs<CR>
" Tabularize end

autocmd! bufwritepost .vimrc source ~/.vimrc
