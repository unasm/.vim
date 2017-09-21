"可不可以让文件每隔一定时间自动保
"go get -u github.com/jstemmer/gotags
let g:neocomplete#enable_at_startup = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:auto_save = 1
let g:auto_save_no_updatetime = 1
let g:auto_save_silent = 1

"set shell='/bin/zsh'
source ~/.vimrc.bundles
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
"filetype indent on
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
"awinpos 5 5          " 设定窗口位置  
"set lines=40 columns=155    " 设定窗口大小  
set nu              " 显示行号  

"<c-h> => Left
"<c-j> => Down
"<c-k> => Up
"<c-l> => Right
"<c-\> => Previous split

set go=             " 不要图形按钮  

set ff=unix
"关闭错误提示的声音
set vb t_vb=
syntax on           " 语法高亮  
"colorscheme desert   "之前之所以两个，是因为叠加之后的半透明，现在放弃（gnome不支持）
syntax enable           " 语法高亮  
set guifont=Courier_New:h14:cANSI   " 设置字体  



"autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
set cmdheight=1     " 命令行（在状态行下）的高度，设置为1  
autocmd BufNewFile *.py,*.css,*.js,*.php,*.cpp,*.[ch],*.sh,*.java ks|call TitleSet()|'s
""定义函数SetTitle，自动插入文件头 
func TitleSet() 
	"如果文件类型为.sh文件 
	let mail = "doujm@jiedaibao.com"
	let time = strftime("%F %T")
	let author = 'unasm'
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."),   "\# File Name :    ".expand("%")) 
		call append(line(".")+1, "\# Author :       ".author) 
		call append(line(".")+2, "\# mail :         ".mail) 
		call append(line(".")+3, "\# Last_Modified: ".time) 
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "") 
	elseif &filetype == 'php' 
		call setline(1, "<?php") 
		call append(line("."), "/*************************************************************************") 
		call append(line(".")+1, " * ") 
		call append(line(".")+2, " * File Name :    ".expand("%")) 
		call append(line(".")+3, " * Author    :    "."doujm") 
		call append(line(".")+4, " * Mail      :    "."doujm@jiedaibao.com") 
		call append(line(".")+5, " ************************************************************************/") 
		call append(line(".")+6, "")

	elseif &filetype == 'python' 
	    call setline(1, "# -*- coding: UTF-8 -*-") 
		call append(line("."), "#") 
		call append(line(".")+1, "# File Name    :    ".expand("%")) 
		call append(line(".")+2, "# Author       :    "."doujm") 
		call append(line(".")+3, "# Mail         :    "."doujm@jiedaibao.com") 
		call append(line(".")+4, "# Create Time  :    ".time) 
		call append(line(".")+5, "############################################### ") 
		call append(line(".")+6, "") 
        call append(line(".")+7, "import os") 
		call append(line(".")+8, "import sys") 
		call append(line(".")+9, "import numpy as np") 
		call append(line(".")+10, "import pandas as pd") 
		call append(line(".")+11, "import matplotlib.pyplot as plt"
		call append(line(".")+12, "") 
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "  * File Name :     ".expand("%")) 
		call append(line(".")+1, "  * Author  :       ".author) 
		call append(line(".")+2, "  * Mail :          ".mail) 
		call append(line(".")+3, "  * Last_Modified : ".time) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
		call GetSnippets(snippets_dir , 'html')
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	"新建文件后，自动定位到文件末尾
endfunc

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

map <C-t> :NERDTreeToggle<CR>
"打开树状文件目录列出当前目录文件.这个算是比较重要的功能，保留
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
inoremap <c-v> <esc>:w<cr>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc %  -o %<"
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
		exec "!php -f %"
	elseif &filetype == 'go'
		exec "! go build % && ./%<"
    elseif &filetype == 'lua'
		exec "! luajit %"
    elseif &filetype == 'python'
		exec "! python %"
	endif

endfunc
"C,C++的调试
map <F7> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	"exec "!g++ % -g -o %<"
	"exec "!gdb ./%<"
	if &filetype == 'c'
			exec "!gcc -g %  -o %<"
			"exec "!gcc ./*.c -o %<"
			exec "!cgdb ./%<"
		elseif &filetype == 'cpp'
			"exec "!g++ % -o %<.o"
			"exec "! ./%<"
			exec "!g++ -g %  -o %<"
			exec "!cgdb ./%<"
		elseif &filetype == "go"
			exec "!go build -gcflags '-N -l' main.go" 
			exec "!cgdb ./%<"

	endif
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
" 退出插入模式的时候哦u，自动保存
au InsertLeave * write
set ruler                   " 打开状态栏标尺
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\%y\%(\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)

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
" 用空格代替制表符
set expandtab
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
set nowrap
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
set shell=/bin/zsh

"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let Tlist_Ctags_Cmd = '/usr/bin/ctags' 
let Tlist_Sort_Type = "name"    " 按照名称排序  
let Tlist_Inc_Winwidth = 0  "禁止自动改变当前vim窗口
let Tlist_Use_SingleClick=1 "点击跳转
let Tlist_Compart_Format = 1    " 压缩方式  
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_Close_On_Select=1 "选择后自动关闭,很好的功能
let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  
let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的

let Tlist_GainFocus_On_ToggleOpen = 1 "打开的时候获取焦点
"let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口

let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Max_Submenu_Items = 10
let Tlist_Max_Tag_Length = 10
let TlistShowTag = 1
"let Tlist_WinWidth = 18
"set tags=/usr/local/go/src/tags;
"set tags=/Users/tianyi/reading-code-of-nginx-1.9.2/nginx-1.9.2/src/tags;
"set tags=/usr/local/var/www/basic/tags;
"set tags=/data1/www/htdocs/jiamin1/earth/tags;
"设置tags  
"set tags=tags  
"set autochdir 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"其他东东
" minibufexpl插件的一般设置
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1   
"nnoremap <silent><F8><F8> :TlistToggle<cr> 
nnoremap <silent><F8><F8> :TagbarToggle<cr> 
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_width = 20
let g:tagbar_autoclose = 1
let g:tagbar_autoshowtag = 0
"觉得使用一个<F8>有点浪费了这个快捷键1
inoremap l<space> <space>=<space>
inoremap ll<space> l
inoremap i<space> +
inoremap ii<space> i
set guioptions-=T  
set guioptions+=r  
set guioptions-=L  
set guioptions+=m

highlight MyTagListTagName guifg=Cyan ctermfg=Cyan
hi Pmenu ctermbg=DarkCyan guibg=white guifg=DarkCyan
hi comment term=bold guifg=#000fff ctermfg=DarkGray
hi phpComment term=bold guifg=#000fff ctermfg=DarkGray
"  将注释变成这种黑灰色，不干扰视线也可以看清
set cursorline
hi CursorLine   cterm=underline ctermbg=none  ctermfg=none guibg=darkened guifg=white
set cursorcolumn
hi CursorColumn cterm=None ctermbg=DarkCyan  ctermfg=white guibg=darkened guifg=white

"该语句会导致下划线高亮失效
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行  

au BufLeave * set nocursorline nocursorcolumn
au BufEnter * set cursorline cursorcolumn

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
"au BufWinLeave,FileWritePost,BufWritePost *.php ks|call FormatPHP()|'s
au BufWritePost *.php ks|call FormatPHP()|'s
function FormatPHP() 
        exec "silent !php-cs-fixer fix  %"
        exec "redraw!"
endfunction
au filetype css call AddCssList()
function AddCssList()
	set dictionary-=~/.vim/dict/csslist.txt dictionary+=~/.vim/dict/csslist.txt
	set complete-=k complete+=k
endfunction
"php 词典
au filetype php call AddPHP()
function AddPHP()
	set dictionary-=~/.vim/dict/php_funclist.txt dictionary+=~/.vim/dict/php_funclist.txt
	"set dictionary-=~/.vim/dict/ci_funclist.txt dictionary+=~/.vim/dict/ci_funclist.txt "支持ci框架
	set complete-=k complete+=k
endfunction
au filetype javascript  call AddJavaScript()
function AddJavaScript()
	set dictionary-=~/.vim/dict/javascript.dict dictionary+=~/.vim/dict/javascript.dict
	set complete-=k complete+=k
endfunction
"let d8_command = '/usr/local/bin/d8'
inoremap NOW  <c-r>=strftime("%F %T")<cr>
let mapleader = ","
inoremap <buffer><silent><end> <esc>:call AppendQuote()<CR><esc>A


noremap <buffer><silent><S-J> <esc>:call AppendQuote()<CR><esc>A
inoremap <buffer><silent><end> <esc>:call AppendQuote()<CR><esc>A
func AppendQuote()
	"最终版本
	"if &filetype != "html" && &filetype !="vim" && &filetype != "zsh"
		"上面四种文件都不需要加分号，html文件，vimrc，zshrc 和bash的脚本vim zsh 是.vimrc .zshrc的filetype
		let status =  CheckLine()
		if status == '0'
			exec "normal A;"
		else 
			exec "normal A"
		endif
	"endif
	return 'normal'
endfunc
func CheckLine()
	"这个经验，可以写一篇文章了吧
	let line = getline(".")
	let flag = match(line,'\c^\s*if\s\?(.*\s*{\? *$')
	"如果是if(){这种形式的，结尾不添加分号，如果结尾含有下面的集中符号，也不添加分号
	if flag == '0'
		return 1
	endif
	let flag = match(line,'^.*[,}{>\[*;(/]\s*$')
	if flag == '0'
		return "1"
	endif
	let flag = match(line,'\c\sfunction\s[A-Z\s]\{1,30\}\(.*\)\s*{\?\s*$')
	"如果是function(){这种形式的，结尾不添加分号，如果结尾含有下面的集中符号，也不添加分号,虽说有bug，但是够用了，function在一行开头失效，函数名不能长于30
	if flag != -1
		return 1
	endif
	return "0"
endfunc
"zR 打开所有的折叠
""za Open/Close (toggle) a folded group of lines.
"zA Open a Closed fold or close and open fold recursively.
""zi全部 展开/关闭 折叠
"zo 打开 (open) 在光标下的折叠
""zc 关闭 (close) 在光标下的折叠
"zC 循环关闭 (Close) 在光标下的所有折叠
""zM 关闭所有可折叠区域)
"% 在对应的大括号之前调转

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"function! PhpCheckSyntax()
"endfunction
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-m> :vertical resize +3<CR>
set winaltkeys="no"

"set fileencoding=utf8
set fileencodings=ucs-bom,utf-8,cp936,default,latin1

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

if !exists('g:root_marker')
  let g:root_marker = [".git", '.svn']
endif

function! Search_root()
    let l:root = fnamemodify(".", ":p:h")

    if !empty(g:root_marker)
        let root_found = 0
        let l:cur_dir = fnamemodify(l:root, ":p:h")
        let l:prev_dir = ""
        while l:cur_dir != l:prev_dir
            for tags_dir in g:root_marker
                let l:tag_path = l:cur_dir . "/" . tags_dir
                if filereadable(l:tag_path) || isdirectory(l:tag_path)
                    let root_found = 1 | break
                endif
            endfor

            if root_found
                let l:root = l:cur_dir | break
            endif

            let l:prev_dir = l:cur_dir
            let l:cur_dir = fnamemodify(l:cur_dir, ":p:h:h")
        endwhile

        return root_found ? l:root : fnamemodify(".", ":p:h")
    endif

    return l:root
endfunction


function! GenerateCtags()
    let l:root = fnamemodify(".", ":p:h")
    exe "cd " . Search_root()
    if &filetype == 'c' || &filetype == 'cpp'
        "        call system("ctags -R --c++-types=+p --fields=+ailKSz --extra=+q .")
        "        exe "TlistUpdate"
        echo "tags update complete ... "
    else
        echohl  ErrorMsg | echo "Generate tags fail!" | echohl None
    endif
    exe "cd " . l:root
    call system("ctags -R --c++-types=+p --fields=+ailKSz --extra=+q .")
    exe 'set tags+=' . Search_root() .'/tags'
endfunction


map <silent> <F7><F7> :call GenerateCtags()<cr>
let g:root_marker = ["projectroot",".git","readme.txt" , '.svn']

let g:go_fmt_command = "goimports"


let g:php_cs_fixer_level = "symfony"              " which leve = ?
let g:php_cs_fixer_config = "default"             " configuration
let g:php_cs_fixer_config_file = '.php_cs'       " configuration file
let g:php_cs_fixer_php_path = "php"               " Path to PHP
" If you want to define specific fixers:
let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by
"default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Calcommand with dry-run
let g:php_cs_fixer_verbose = 0      


let g:lua_compiler_name = '/usr/local/bin/luajit'
let g:lua_check_syntax = 1
let g:lua_complete_omni = 1
