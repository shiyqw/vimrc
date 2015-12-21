" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"中文
set helplang=cn

"utf-8编码
set encoding=utf-8

"语法高亮
syntax enable
syntax on
colorscheme MyColor
set t_Co=256

"设置（软）制表符宽度为4：
set tabstop=4
set softtabstop=4
set expandtab


"设置缩进的空格数为4
set shiftwidth=4

"设置自动缩进：即每行的缩进值与上一行相等；使用 noautoindent 取消设置：
set autoindent
set smartindent

"设置使用 C/C++ 语言的自动缩进方式：
set cindent

"设置C/C++语言的具体缩进方式（以我的windows风格为例）：
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s

"如果想在左侧显示文本的行号，可以用以下语句：
set nu
set mouse=a
set modifiable

"如果设置为compatible，则tab将不会变成空格 
set nocompatible 
set backspace=indent,eol,start

"最后，如果没有下列语句，就加上吧：
if &term=="xterm"
set t_Co=8
set t_Sb=^[[4%dm
set t_Sf=^[[3%dm
endif

"For python 
autocmd FileType python set omnifunc=pythoncomplete#Complete  
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

filetype on
filetype plugin on
filetype plugin indent on " 让filetype-plugin根据文件类型自动缩进（这个必须要，它会根据文件类型自动配置缩进，插件在安装vim的时候已经装好了）
set hlsearch " 对被搜索的表达式显示高亮
set incsearch "在输入要搜索的文字时，实时匹配
nmap <f2> :noh<cr>
imap <f2> <esc><f2>a
"将F2设置为清除屏幕高亮，上面两行分别定义了在insert和command模式下两种情况
"noremap <silent> <c-f4> :close<cr>
"imap <c-f4> <esc><c-f4>

"设置ctags
map <F12>  :!ctags -R --c++-kinds=+px --fields=+iaS --extra=+q .<CR>
imap <F12> <esc><f12>

"Taglist
let Tlist_Ctags_Cmd='/usr/bin/ctags'        "为taglist插件指定ctags目录
let Tlist_Use_SingleClick=1        "单击tag就能跳转到该tag定义的位置       
let Tlist_Exit_OnlyWindow=1        "taglist是最后一个窗口时退出VIM
let Tlist_File_Fold_Auto_Close=1        "当同时显示多个文件tag时,可使taglist只显示当前tag,其他文件的tag都折叠起来
let Tlist_Auto_Update=1            "自动更新
"map  <F8> :WMToggle<cr>
"imap <f8> <esc><f8>

"自动保存折叠
au BufWinLeave * silent mkview
au BufWinEnter * silent loadview

"Winmanager

"let g:winManagerWindowLayout='FileExplorer|TagList' " 设置窗口布局

"BufExplorer

"noremap <silent> <F11> :BufExplorer<CR>
"noremap <silent> <m-F11> :BufExplorerHorizontalSplit<CR>
"noremap <silent> <c-F11> :BufExplorerVerticalSplit<CR>
"imap <f11> <esc><f11>
"let g:miniBufExplMapCTabSwitchBufs = 1

"omnicppcompletesource ~/.vim/plugin/autotag.vim 

set tags+=/usr/share/vim/vim74/tags/cpptags

"set nocp
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview

" 
"source /usr/share/vim/vim73/plugin/autotags.vim		


"括号引号补全

":inoremap <S-ENTER> <c-r>=SkipPair()<CR>
":inoremap <S-SPACE> <ESC>la
":inoremap <C-ENTER> <ESC>A;<CR>
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { <c-r>=ClsoeBrace()<CR>
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap { {<enter>}<esc>O
":inoremap <enter> <c-r>=AutoEnter()<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
" :inoremap < <><ESC>i
" :inoremap > <c-r>=ClosePair('>')<CR>
":inoremap " <c-r>=QuoteDelim('"')<CR>
":inoremap ' <c-r>=QuoteDelim("'")<CR>
"inoremap ;; <ESC>A;<CR>

function ClosePair(char)
   if getline('.')[col('.') - 1] == a:char
      return "\<Right>"
   else
      return a:char
   endif
endf

function ClsoeBrace()
   if getline('.')[col('.') - 2] == '='
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 3] == '='
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 1] == '{'
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 2] == '{'
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 2] == ','
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 3] == ','
      return "{}\<ESC>i"
   else
      return "{\<ENTER>}\<ESC>O"
   endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf

function AutoEnter()
  if getline('.')[col('.') - 1] == '}'
      return "\<ENTER>\<esc>O"
  else
      return "\<enter>"
  endif 
endf


nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

set pastetoggle=<f5>
runtime macros/matchit.vim

