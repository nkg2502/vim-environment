"backup 관련된 내용 체크
"2012.12.21
"2012.12.26 추가 수정

colorscheme molokai
set visualbell

set nocompatible
set backspace=indent,eol,start

set number		" line number
"set numberwidth=6	" line number width, not works
set nowrap
set ruler		" show the cursor position all the time

" status bar
set ls=2		" last status 2 row

set statusline=

set statusline+=%m "modify

set statusline+=%r "readonly

" style : [unix/utf-8(BOM)]
set statusline+=[
set statusline+=%{&ff} "eol
set statusline+=/ "delimiter
set statusline+=%{''.(&fenc!=''?&fenc:&enc).''} "encoding
set statusline+=%{(&bomb?\"BOM\":\"\")} "BOM
set statusline+=]

set statusline+=\ "separator

" style : [ruby]
set statusline+=%y "syntax

set statusline+=%=

set statusline+=%l-%L:
set statusline+=%2c

set statusline+=\ "separator

set statusline+=(%2P)

set statusline+=\ "separator
set statusline+=[%f]

" recommand 
set wildmenu		" Tab 자동 완성시 가능한 목록을 보여줌 
set showcmd		" display incomplete commands

" search
set incsearch		" do incremental searching
set hlsearch		" highlight search
set smartcase		" 검색시에 대문자를 포함하고 있으면 대/소를 구별

" indent
set autoindent		" always set autoindenting on
set cindent
set smartindent

" tab
" 영역이 지정된 상태에서 Tab과 Shift + Tab으로 들여쓰기/내어쓰기 가능
vmap <Tab> >gv
vmap <S-Tab> <gv

" backup
set nobackup
" 또는 backup되는 위치를 한 곳으로 모으고 싶다
set history=1024

syntax enable
filetype on
filetype plugin indent on

" encoding
set fencs=ubs-bom,utf-8,korea
"set fileencoding=utf-8

" eol
set ffs=unix,dos,mac
"set ff=unix

" GUI
if has("gui_running")
	set guioptions+=b
	set guifont=DejaVu_Sans_Mono:h14
	set clipboard=unnamed "clipboard 연결
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
endif

" Map
map <F3> v]}zf
map <F4> zo

"F5 : NERDTree
map <F5> :NERDTreeToggle <CR>

"F9 : compile
au FileType c map <F9> :!gcc -W -Wall % -o %< -g
au FileType cpp map <F9> :!g++ -W -Wall % -o %< -g

" F11 execute
if has("gui_running")
	au FileType c,cpp map <F11> :!%< <CR>
elseif has("unix")
	au FileType c,cpp map <F11> :!./%< <CR>
endif
au FileType ruby map <F11> :!ruby % <CR>
au FileType python map <F11> :!python % <CR>

" F12 debug
au FileType c,cpp map <F12> :!gdb -q %< <CR>

" 한글 보정(작동 안하는 듯)
ca ㅈ w
ca ㅈㅂ wq

" SwapExists 조금더 고민해보자
"au SwapExists * let v:swapchoice = 'o'

