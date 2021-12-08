
call plug#begin('~/.vim/plugged')
Plug 'connorholyday/vim-snazzy'
Plug 'lyokha/vim-xkbswitch'                 "neovim notsupport
Plug 'DeXP/xkb-switch-win'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdcommenter'
Plug 'luochen1990/rainbow'
Plug 'ycm-core/YouCompleteMe'
Plug 'Raimondi/delimitMate' "Vim自动括号补全
Plug 'vim-scripts/taglist.vim' "11 Vim函数整理,帮助你生成当前程序的所有函数和变量索引，F4激活
Plug 'tbastos/vim-lua' " Lua高亮
Plug 'WolfgangMehner/lua-support' " Lua支持，包括编译，帮助
Plug 'mg979/vim-visual-multi', {'branch': 'master'} "多行选择插件
Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } } "文件查找插件
Plug 'fholgado/minibufexpl.vim' " buffer管理器
Plug 'BurntSushi/ripgrep' " rg
Plug 'scrooloose/syntastic' "语法检测
Plug 'sheerun/vim-polyglot' "代码高亮
Plug 'danilo-augusto/vim-afterglow' "主题
Plug 'ajmwagar/vim-deus' "主题
Plug 'NLKNguyen/papercolor-theme' "主题
Plug 'sainnhe/sonokai' "主题
Plug 'joshdick/onedark.vim' "主题
Plug 'rking/ag.vim' "搜索插件ag
Plug 'dyng/ctrlsf.vim' "搜索插件
Plug 'jremmen/vim-ripgrep' "rg
call plug#end()

let mapleader = ","

" 设置打开文件的编码格式
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8

"设置启动时界面大小
winpos  50 50 "设置初始界面位置
set lines=50 columns=300
set textwidth=300
set nowrap

set number
map R :source $MYVIMRC<CR>
"colorscheme snazzy
"colorscheme deus
"set background=light
"colorscheme PaperColor
"set background=dark
"colorscheme PaperColor


colorscheme afterglow
set encoding=utf-8
syntax on
language C
set nocompatible
set langmenu=en_US
let $LANG= 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
filetype on
filetype indent on
filetype plugin on
set mouse=a

" 将缩进设置为空格
let &t_ut=''
set expandtab

"缩进配置为4空格
set tabstop=4                
set shiftwidth=4
set softtabstop=4

"
"尽可能在滚动的时候留下几行
set scrolloff=5

"开启退格跨行退格
set backspace=indent,eol,start

"开启代码折叠
set foldmethod=indent
set foldlevel=99

"在三种模式下采用三种光标
let &t_SI = "<Esc>]50;CursorShape=1x7"
let &t_SR = "<Esc>]50;CursorShape=2x7"
let &t_EI = "<Esc>]50;CursorShape=0x7"

"永远保留命令行
set laststatus=2


"自动缩进
set autoindent

"隐藏gVim的四个滚动条
set guioptions-=T   "Hide Tool-Bar
set guioptions-=r   "hide right scroll
"set guioptions-=b   "hide buttom scoll
set guioptions-=L   "hide left scroll

"突出显示选中的字符所在行列
set cursorline
set cursorcolumn

"自动换行
set wrap

"显示输入的命令(右下角)
set showcmd

"智能查找 高亮显示结果
set hlsearch    
exec "nohlsearch"    
set incsearch    
set ignorecase        
set smartcase

"避免中文输入法报警
let g:XkbSwitchEnabled     = 1
let g:XkbSwitchIMappings   = ['cn']
let g:XkbSwitchIMappingsTr = {'cn': {'<': '', '>': ''}}

"vim 内部的TOTO List：undoTree
map <F5> :UndotreeToggle<CR>

"Vim内部的文件树：NERDTreeToggle
map ff :NERDTreeToggle<CR>

set ambiwidth=double                    " 设置为双字宽显示，否则无法完整显示如:☆
let g:airline_theme='bubblegum'        "Airline主题
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1      "tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '   "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'      "tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1      
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '🔰'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>als :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>ald :ALEDetail<CR>
"set statusline=%F%m%r%h%w [FORMAT=%{&ff}] [TYPE=%Y] [POS=%l,%v][%p%%] %{strftime("%d/%m/%y - %H:%M")} %{ALEGetStatusLine()}
"cpp NOT C++
let g:ale_linters = {'cpp': ['gcc'],'c': ['gcc'],'python': ['pylint'],'lua': ['luac'],}

"代码注释插件
let g:NERDCompactSexyComs = 1
map <C-m> <leader>cc
map <A-m> <leader>cu

"括号匹配插件
let g:rainbow_active = 1

"代码只能提示
set runtimepath+=~/.vim/plugged/YouCompleteMe
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口"
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0                            " 关闭加载.ycm_extra_conf.py提示
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键,没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"
" 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 跳转到定义处
let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_semantic_triggers =  { 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],'cs,lua,javascript': ['re!\w{2}'],}

"帮助你生成当前程序的所有函数和变量索引
let Tlist_Use_Right_Window=1 
let Tlist_Inc_Winwidth=0 
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_Onluwindow=1
map <F4> :TlistToggle<cr>

nnoremap <A-n> :tabn<cr>
noremap <leader>cla :Clap files!<cr>
noremap <leader>clr :Clap grep<cr>
nnoremap <leader>nf :NERDTreeFind
nnoremap <leader>nr :NERDTreeRefreshRoot
nnoremap <leader>nt :NERDTree
nnoremap <leader>nm :NERDTreeMirror<cr>
nnoremap <leader>no :NERDTreeFocus<cr>

"缓冲区命令
nmap <leader>bn :bnext<cr>
nmap <leader>bp :bprevious<cr>
nmap <leader>bf :bfirst<cr>
nmap <leader>bl :blast<cr>
nmap <leader>bt :buffer 

"minibufexpl 设置
let g:miniBufExplVSplit = 40
let g:miniBufExplBRSplit = 1
let g:miniBufExplMaxSize = 100
let g:miniBufExplBuffersNeeded = 0
map <Leader>mbe :MBEOpen<cr>
map <Leader>mbc :MBEClose<cr>
map <Leader>mbt :MBEToggle<cr>

"清除高搜索高亮
nmap <leader>ch :noh<cr>
                        
"代码高亮插件设置
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}    
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI

function OpenFileLocation()
	if ( expand("%") != "" )
		execute "!start explorer /select, %" 
    else    
		execute "!start explorer /select, %:p:h"
	endif
endfunction
map <leader>ocf :call OpenFileLocation()<CR>
nnoremap <silent> <leader>cdc :cd %:p:h<CR>

"搜索插件设置
let g:ctrlsf_backend = 'rg'
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_compact_position = 'bottom_inside'
let g:ctrlsf_preview_position = 'inside'

nnoremap <leader>cff :CtrlSF
nnoremap <leader>cfu :CtrlSFUpdate<cr> 
nnoremap <leader>cft :CtrlSFToggle<cr> 
nnoremap <leader>cfm :CtrlSFToggleMap<cr> 
nnoremap <leader>cfo :CtrlSFFocus<cr> 

