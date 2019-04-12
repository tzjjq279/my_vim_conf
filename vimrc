
" Plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"添加插件
set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'jnurmine/Zenburn'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'
"Plugin 'vim-latex/vim-latex'
call vundle#end()
filetype plugin indent on

"NERDTree
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

"关闭NERDTree快捷键
map <leader>t :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=2
let NERDTreeAutoCenter=2
" 是否显示隐藏文件
let NERDTreeShowHidden=2
" 设置宽度
let NERDTreeWinSize=22
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=2
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=2

" YcmCompleter
let g:ycm_autoclose_preview_window_after_completion=2

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_python_binary_path = 'python'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py' "此处是全局配置文件路径
let g:ycm_confirm_extra_conf = 1 "关闭每次导入配置文件前的询问
let g:syntastic_always_populate_loc_list = 2 "方便使用syntastic进行语法检查
let g:ycm_seed_identifiers_with_syntax=2 " 开启语法关键字补全

" Snips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Plugin Config - vimtex {{{ "
let g:tex_flavor='latex'
"let g:vimtex_view_method= 'zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

":au! CursorHoldI,CursorHold <buffer> silent! :update
":set updatetime=500
"winpos 0 0
":set spell
"set lines=47 columns=65
"colo evening

" 一般设置  
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nohlsearch
set nu		"显示行号        
set go=   	"不要图形按钮     
set showcmd	"输入命令显示
set novisualbell
set laststatus=2
set foldenable
set nocompatible
set ruler



"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"设置配色方案
colorscheme molokai
set bg=dark
"color asmanian3     " 设置背景主题  
set guifont=Courier_New:h14:cANSI   " 设置字体  
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  

if has("syntax")
  syntax on
endif

set autoindent
set cindent
set tabstop=5
set softtabstop=5
set shiftwidth=5
set noexpandtab
set showmatch
set matchtime=2
set scrolloff=4
set smartindent

au BufRead,BufNewFile *  setfiletype txt

"设置split窗体位置
set splitbelow
set splitright

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set noundofile
set nobackup
set noswapfile
set autoread

set completeopt=preview,menu 
set clipboard+=unnamed 
"自动保存
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏

" 设置在状态行显示的信息
set foldcolumn=1
set foldmethod=indent 
set foldlevel=4 
set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 去掉输入错误的提示声音
set noeb
set confirm
set history=1001

set ignorecase
set hlsearch
set incsearch
set nocompatible

set backspace=indent,eol,start
set gdefault
set langmenu=zh_CN.UTF-8
set helplang=cn
set laststatus=3
set cmdheight=3

" 命令行（在状态行下）的高度，默认为2，这里是2
set cmdheight=3
" 侦测文件类型
filetype on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

"自动补全
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap { {}<ESC>i
inoremap <S-CR> <ESC>la

function! ClosePair(char)
	if getline('.')[col('.') - 2] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

" 定义跳出括号函数，用于跳出括号 
func SkipPair()
	if getline('.')[col('.') - 2] == ')' ||
	   getline('.')[col('.') - 2] == ']' || 
	   getline('.')[col('.') - 2] == '"' || 
	   getline('.')[col('.') - 2] == "'" || 
	   getline('.')[col('.') - 2] == '}'
		return "\<ESC>la"
	else
		return "\t"
	endif
endfunc
inoremap <TAB> <c-r>=SkipPair()<CR>
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

"编译运行
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"C C++ Python Java 编译运行

"新文件
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
func SetTitle() 
	if &filetype == 'cpp'
		call setline(2, '#include<iostream>')
		call append(line(".")+2, "using namespace std;")
		call append(line(".")+3, "")
	endif
	autocmd BufNewFile * normal G
endfunc


