
" Plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"添加插件
set nocompatible              " required
filetype off                  " required

set rtp+=/usr/share/vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'jnurmine/Zenburn'

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
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=21
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

" YcmCompleter
let g:ycm_autoclose_preview_window_after_completion=1

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_python_binary_path = 'python'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py' "此处是全局配置文件路径
let g:ycm_confirm_extra_conf = 0 "关闭每次导入配置文件前的询问
let g:syntastic_always_populate_loc_list = 1 "方便使用syntastic进行语法检查
let g:ycm_seed_identifiers_with_syntax=1 " 开启语法关键字补全


" 一般设置  
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nohlsearch
set nu		"显示行号        
set go=   	"不要图形按钮     
set showcmd	"输入命令显示
set novisualbell
set laststatus=1
set foldenable
set nocompatible
set ruler



"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"设置配色方案
colorscheme molokai
set bg=dark
"color asmanian2     " 设置背景主题  
set guifont=Courier_New:h13:cANSI   " 设置字体  
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  

if has("syntax")
  syntax on
endif

set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set showmatch
set matchtime=1
set scrolloff=3
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
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 去掉输入错误的提示声音
set noeb
set confirm
set history=1000

set ignorecase
set hlsearch
set incsearch

set gdefault
set langmenu=zh_CN.UTF-8
set helplang=cn
set laststatus=2
set cmdheight=2

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
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
inoremap { {<CR>}<ESC>O
inoremap <C-F> <ESC>la

function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

" 定义跳出括号函数，用于跳出括号 
func SkipPair()
	if getline('.')[col('.') - 1] == ')' ||
	   getline('.')[col('.') - 1] == ']' || 
	   getline('.')[col('.') - 1] == '"' || 
	   getline('.')[col('.') - 1] == "'" || 
	   getline('.')[col('.') - 1] == '}'
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
		call setline(1, '#include<iostream>')
		call append(line(".")+1, "using namespace std;")
		call append(line(".")+2, "")
	endif
	autocmd BufNewFile * normal G
endfunc


