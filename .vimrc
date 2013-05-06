"可不可以让文件每隔一定时间自动保
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
"awinpos 5 5          " 设定窗口位置  
"set lines=40 columns=155    " 设定窗口大小  
set nu              " 显示行号  
set go=             " 不要图形按钮  
colorscheme default     " 设置背景主题  
colorscheme koehler
set nowrap
set guifont=Courier_New:h10:cANSI   " 设置字体  
syntax on           " 语法高亮  
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
"autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
set cmdheight=1     " 命令行（在状态行下）的高度，设置为1  
autocmd BufNewFile *.php,*.cpp,*.[ch],*.sh,*.java ks|call TitleSet()|'s
""定义函数SetTitle，自动插入文件头 
func TitleSet() 
	"如果文件类型为.sh文件 
	let mail = "douunasm@gmail.com"
	let author = "unasm"
	let time = strftime("%F %T")
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Author :".unasm) 
		call append(line(".")+2, "\# mail: ".mail) 
		call append(line(".")+3, "\# Last_Modified: ".time) 
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "") 
	elseif &filetype == 'php' 
		call setline(1, "<?php") 
		call append(line("."), "/*************************************************************************") 
		call append(line(".")+1, "    > File Name: ".expand("%")) 
		call append(line(".")+2, "    > Author: ".author) 
		call append(line(".")+3, "    > Mail: ".mail) 
		call append(line(".")+4, "    > Last_Modified: ".time) 
		call append(line(".")+5, " ************************************************************************/") 
		call append(line(".")+6, "")
		call append(line(".")+7, "?>")
		call cursor("6",0)
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "    > File Name: ".expand("%")) 
		call append(line(".")+1, "    > Author: ".author) 
		call append(line(".")+2, "    > Mail: ".mail) 
		call append(line(".")+3, "    > Last_Modified: ".time) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	"新建文件后，自动定位到文件末尾
endfunc
"这个函数的作用就是自动修改Last_Modified的时间，格式上面自动添加注释的时间格式相同
autocmd BufWritePre,FileWritePre *.php ks|call LastModified()
fun LastModified()
	let l = line("$")
	let time = strftime("%F %T")
	exe "1," . l . 'g/^\s*\(\*\|#\|>\|"\|\/\/\)\?\s*[L]ast_Modified:\s/s/^\(\s*\(\*\|#\|>\|"\|\/\/\)\?\s*[L]ast_Modified:\s\).*/\1'.time
endfun
" i don't understand that
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>f :find<cr>
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
map <c-t> :tabnew .<CR>  
"打开树状文件目录列出当前目录文件.这个算是比较重要的功能，保留
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
"inoremap <end>  <end><esc>a;
inoremap <c-v> <esc>:w<cr>
"自动保存文件
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%
	elseif &filetype == 'php'
		exec "!php -l %"
	endif
endfunc
"C,C++的调试
map <F6> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
"允许插件  
filetype plugin on
"共享剪贴板  
set clipboard+=unnamed 
"从不备份  
set nobackup
"make 运行
:set makeprg=g++\ -Wall\ \ %
"自动保存
set autowrite
set ruler                   " 打开状态栏标尺
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 语法高亮
set syntax=on
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"禁止生成临时文件
"set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行，当为1的时候，不显示状态
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1
" 侦测文件类型,以上两个全部改成1，也就是合并成为一行，节省空间
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set lazyredraw
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
"set fillchars=vert:\ 
"set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1000
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=5
" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
"au BufRead,BufNewFile *  setfiletype txt
"自动补全
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Sort_Type = "name"    " 按照名称排序  
"let Tlist_Inc_Winwidth = 0  "禁止自动改变当前vim窗口
"let Tlist_Use_SingleClick=1 "点击跳转
"let Tlist_Compart_Format = 1    " 压缩方式  
"let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
"let Tlist_Close_On_Select=1 "选择后自动关闭,很好的功能
"let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
"let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"设置tags  
"set tags=tags  
"set autochdir 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"其他东东
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""" 
" Tag list (ctags) 
"""""""""""""""""""""""""""""""" 
"let Tlist_Ctags_Cmd = '/usr/local/bin/ctags' 
"let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 ,0,或许就是显示多个文件的吧
"let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
"let Tlist_WinWidth = 18
" minibufexpl插件的一般设置
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1   
nnoremap <silent><F8><F8> :TlistToggle<cr> 
"觉得使用一个<F8>有点浪费了这个快捷键1
inoremap l<space> <space>=<space>
inoremap ll<space> l
inoremap i<space> +
inoremap ii<space> i
set guioptions-=T  
set guioptions+=r  
set guioptions-=L  
set guioptions+=m


set cursorline
hi CursorLine   cterm=NONE ctermbg=magenta  ctermfg=white guibg=NONE guifg=white gui=underline
set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=cyan  ctermfg=white guibg=darkened guifg=white
"if !did_filetype()
"	    au BufRead,BufNewFile *             setfiletype text
"endif
"打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1
let g:jslint_command = 'jsl' 
"let g:jslint_command_options = '-nofilelisting -nocontext -conf "~/.jsl.conf" -nosummary -nologo -process'
"autocmd BufWritePost,FileWritePost *.js calJsonLint()
"map <F6> :call	JsonLint()<cr>
"设置javascriptlint
"autocmd FileType javascript set makeprg=/usr/local/bin/jsl -nologo -nofilelisting -nosummary -nocontext -conf '~/.jsl.conf' -process %
"autocmd FileType javascript set errorformat=%f(%l): %m
"autocmd FileType javascript inoremap <silent> <F9> <C-O>:make<CR>
"autocmd FileType javascript map <silent> <F9> :make<CR>
"jslint 尝试失败
" css辞典
au filetype css call AddCssList()
function AddCssList()
	set dictionary-=~/.vim/dict/csslist.txt dictionary+=~/.vim/dict/csslist.txt
	set complete-=k complete+=k
endfunction
"php 词典
au filetype php call AddPHP()
function AddPHP()
	set dictionary-=~/.vim/dict/php_funclist.txt dictionary+=~/.vim/dict/php_funclist.txt
	set dictionary-=~/.vim/dict/ci_funclist.txt dictionary+=~/.vim/dict/ci_funclist.txt "支持ci框架
	set complete-=k complete+=k
endfunction
au filetype javascript  call AddJavaScript()
function AddJavaScript()
	set dictionary-=~/.vim/dict/javascript.dict dictionary+=~/.vim/dict/javascript.dict
	set complete-=k complete+=k
endfunction
"let d8_command = '/usr/local/bin/d8'
inoremap PHPT author:<tab><tab><tab>unasm<cr>email:<tab><tab><tab>douunasm@gmail.com<cr>Last_Modefied:<tab><c-r>=strftime("%Y/%m/%d %X")<cr><CR>
inoremap NOW  <c-r>=strftime("%F %T")<cr>


inoremap <silent><end> <C-R>=AppendQuote()<cr>
func AppendQuote()
	if &filetype != "html" 
		let status =  CheckLine()
		if status == '0'
			exec "normal $a;"
		else 
			exec "normal $"
		endif
	endif
	return "\<esc>A"
endfunc
func CheckLine()
	"这个经验，可以写一篇文章了吧
	let line = getline(".")
	let flag = match(line,'\c^\s*if\(.*\)\s*{\?\s*$')
	"如果是if(){这种形式的，结尾不添加分号，如果结尾含有下面的集中符号，也不添加分号
	if flag == '0'
		return 1
	endif
	let flag = match(line,'^.*[,}{>\[*;(/]\s*$')
	if flag == '0'
		return "1"
	endif
	return "0"
endfunc

