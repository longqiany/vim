" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set ru   " 该命令打开 VIM 的状态栏标尺。
set hls  " 搜索时高亮显示被找到的文本。
set backspace=indent,eol,start  " 可以删除前面内容，不受vim之前的限制。（只能删除刚刚编写的）

set whichwrap=b,s,<,>,[,]  "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>

"共享剪贴板  
set clipboard+=unnamed 
set autochdir

set tabstop=4                " 设置Tab键的宽度        [等同的空格个数]  
set shiftwidth=4  
set expandtab                " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]  
" 按退格键时可以一次删掉 4 个空格  
set softtabstop=4 
" 在行和段开始处使用制表符
set smarttab

" Set 7 lines to the cursor - when moving vertically using j/k上下滚动,始终在中间  
set so=7  

"autocmd vimenter * NERDTree
"execute pathogen#infect()


map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
         exec "!g++ % -o %<"
         exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java'
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
         :!./%
    endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

let g:winManagerWindowLayout='FileExplorer,BufExplorer|TagList'
"let g:winManagerWindowLayout='NERDTree, BufExplorer|TagList'
nmap wm :WMToggle<cr>

if has("vms")
set nobackup " do not keep a back file use version instead
else 
 set backup 
endif

set history=50  " keep 50 lines of command line history

set showcmd      "在状态栏显示正在输入的命令
set showmode     "命令行显示vim当前模式

"autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
"autocmd InsertEnter * se cul    " 用浅色高亮当前行 

set autoindent 
set cindent         " 设置C／C++方式自动对齐

set t_Co =256      "  制定配色方案为256色。

" Set extra options when running in GUI mode  
if has("gui_running")  
    set guioptions-=T  
    set guioptions+=e  
    set t_Co=256  
    set guitablabel=%M\ %t  
endif  

"设置文内智能搜索提示  
"" 高亮search命中的文本。  
set hlsearch            
" 搜索时忽略大小写  
set ignorecase  
" " 随着键入即时搜索  
set incsearch  
" 有一个或以上大写字母时仍大小写敏感  
set smartcase

" 取消备份。  
" " Turn backup off, since most stuff is in SVN, git et.c anyway...  
set nobackup  
set nowb  
set noswapfile "

if has("multi_byte")
    " UTF-8 编码
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gbk
    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)'
        set ambiwidth=double
    endif
    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif


if has('mouse')
 set mouse=a
endif


 set nu!


colorscheme desert
   syntax enable
   syntax on
set hlsearch

set nocompatible                " be iMproved
filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

"my Bundle here:
"
" original repos on github
Bundle 'kien/ctrlp.vim'
Bundle 'sukima/xmledit'
Bundle 'sjl/gundo.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'klen/python-mode'
Bundle 'Valloric/ListToggle'
Bundle 'SirVer/ultisnips'
"Bundle 'UltiSnips'
let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooluose/syntastic'
"Bundle 't9md/vim-quickhl'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
"..................................
" vim-scripts repos
Bundle 'YankRing.vim'
Bundle 'vcscommand.vim'
Bundle 'ShowPlirs'
Bundle 'SudoEdit.vim'
Bundle 'EasyGrep'
"Bundle 'VOoM'
Bundle 'VimIM'
" Syntax
Bundle 'asciidoc.vim'
Bundle 'confluencewiki.vim'
Bundle 'html5.vim'
Bundle 'JavaScript-syntax'
"Bundle 'mako.vim'
Bundle 'moin.vim'
Bundle 'python.vim--Vasiliev'
Bundle 'xml.vim'
" Color
Bundle 'desert256.vim'
Bundle 'Impact'
Bundle 'matrix.vim'
Bundle 'vibrantink'
Bundle 'vividchalk.vim'
"Bundle 'Project.vim'
Bundle 'restart.vim'
Bundle 'taglist.vim'
Bundle 'winmanager'
"Bundle 'c.vim'

"
"..................................
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

"......................................
filetype plugin indent on " 开启文件类型自动识别，启用文件类型插件，启用针对文件类型的自动缩进。

let g:ycm_global_ycm_extra_conf ='～/.vim/.ycm_extra_conf.py'

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
