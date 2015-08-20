call pathogen#infect()
filetype plugin indent on
autocmd FileType python set omnifunc=pythoncomplete#Complete

":JL

" config
if $BG == "dark"
	set background=dark
else
	set background=light
endif

set t_Co=256
syntax on
set showcmd		" Show (partial) command in status line.
set ts=4
set shiftwidth=4
set hid
set nosol
set ls=2
set ai
"set cinoptions=>s,e0,n0,f0,{0,}0,^0,:0.5s,=0.5s,l0,gs,hs,ps,ts,+s,c3,C0,(2s,us,U0,w0,m0,j0,)20,*30
set cindent
set autoindent
set smartindent
set nocompatible
set showmatch
set cinoptions=:0.5s,=0.5s
set noeb
set vb t_vb=
set tabpagemax=16
set hlsearch
"set hls


"folding settings
set foldmethod=indent "fold based on indent
set foldnestmax=10 "deepest fold is 10 levels
set nofoldenable "disable folding by default
set foldlevel=1

let g:DirDiffExcludes = ".svn,*.class,*.exe,.*.swp"
let g:pydiction_location = '/root/.vim/bundle/pydiction-1.2.1/complete-dict'
let c_hi_identifiers	= 'all' 
let c_hi_libs	 = ['*']
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"

" set taglist
nnoremap <silent> <F1> :Tlist <cr>
nnoremap <silent> <F2> :TlistOpen <cr>
nnoremap <silent> <F3> :q <cr>

map <silent> <F4> \be

" set encoding
"map <F5> :set encoding=utf-8<cr>
"map <F6> :set encoding=big5<cr>
map <F5> zR <cr>
map <F6> zM <cr>
"map <F7> :set paste!<bar>set paste?<cr>
"map <F8> :bn!<cr>

" set the versioning system type to vcscommand
let VCSCommandVCSTypePreference = "svn"
" use vcscommand: |<Leader>|cd VCSDiff 
nnoremap <silent> <F7> :VCSVimDiff <cr>
" return from diff mode to normal mode 
nnoremap <silent> <F8> :set nodiff <cr><cr> :bd <cr>
"nnoremap <silent> <F9> :diffu <cr>
nnoremap <silent> <F9> :TagbarToggle <CR>

" set background
"map <F11> :set background=dark<cr>
"map <F12> :set background=light<cr>
map <F11> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
nnoremap <silent> <F10> :NERDTree <CR>

nmap <C-PageUp> :tabprevious<cr>
nmap <C-PageDown> :tabnext<cr>
map <C-PageUp> :tabprevious<cr>
map <C-PageDown> :tabnext<cr>

nmap <C-Insert> :tabnew<CR>
nmap <C-Delete> :tabclose<CR>

" 設定自動轉換為 UTF-8 編碼
" set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set fileencodings=big5,utf-8,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set encoding=utf8
" set encoding=big5
set tenc=utf8

map tt :tabnext<CR>
map tr :tabprev<CR>
map tn :tabnew<CR>
map td :tabclose<CR>

map vc :VCSCommit <CR>
map vl :VCSLog <CR>
map va :VCSAdd <CR>
map vd :VCSDelete <CR>

let Tlist_Inc_Winwidth=0
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Show_Menu=1
" let Tlist_Use_Right_Window=1

" set Tag

nmap <silent> <C-N><C-N> :set nu!<cr>

au InsertLeave * hi ModeMsg ctermfg=black ctermbg=yellow gui=undercurl guisp=Magenta 
au InsertEnter * hi ModeMsg ctermfg=black ctermbg=grey

set cursorline
set nu

autocmd! bufwritepost .vimrc source ~/.vimrc

" set color scheme
colorscheme my_color_style
"colorscheme molokai

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

set tags=./tags,tags;$HOME

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
set backspace=indent,eol,start

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0 

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
	\ 'p:package',
	\ 'i:imports:1',
	\ 'c:constants',
	\ 'v:variables',
	\ 't:types',
	\ 'n:interfaces',
	\ 'w:fields',
	\ 'e:embedded',
	\ 'm:methods',
	\ 'r:constructor',
	\ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
	\ 't' : 'ctype',
	\ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
	\ 'ctype' : 't',
	\ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

