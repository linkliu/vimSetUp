call plug#begin('~/.vim/plugged')
Plug 'skywind3000/vim-quickui' "菜单
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'connorholyday/vim-snazzy'
Plug 'lyokha/vim-xkbswitch'                 "neovim notsupport
Plug 'godlygeek/tabular'
Plug 'DeXP/xkb-switch-win'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'} "智能提示
Plug 'Raimondi/delimitMate' "Vim自动括号补全
Plug 'yegappan/taglist' " Vim函数整理,帮助你生成当前程序的所有函数和变量索引
Plug 'WolfgangMehner/lua-support' "Lua插件
Plug 'mg979/vim-visual-multi', {'branch': 'master'} "多行选择插件
Plug 'fholgado/minibufexpl.vim' " buffer管理器
Plug 'BurntSushi/ripgrep' " rg
Plug 'scrooloose/syntastic' "语法检测
Plug 'danilo-augusto/vim-afterglow' "主题
Plug 'ajmwagar/vim-deus' "主题
Plug 'NLKNguyen/papercolor-theme' "主题
Plug 'sainnhe/sonokai' "主题
Plug 'joshdick/onedark.vim' "主题
Plug 'dracula/vim', { 'as': 'dracula'} "主题 
Plug 'sonph/onehalf', {'rtp': 'vim/'} "Onehalf主题
Plug 'kaicataldo/material.vim', { 'branch': 'main' } "material主题
Plug 'rking/ag.vim' "搜索插件ag
Plug 'dyng/ctrlsf.vim' "搜索插件
Plug 'luochen1990/rainbow' "括号对颜色
Plug 'sheerun/vim-polyglot' "代码高亮
Plug 'nathanaelkane/vim-indent-guides' "代码块颜色显示
Plug 'junegunn/vim-easy-align'
call plug#end()

let mapleader = ","
set nocompatible
set encoding=utf-8
set langmenu=en_US
let $LANG= 'en_US'
" 设置打开文件的编码格式
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set termencoding=cp936
language messages zh_CN.utf-8 "设置中文提示
set ambiwidth=double "设置为双字宽显示，否则无法完整显示如:☆

"设置启动时界面大小
"winp  50 50 "设置初始界面位置
set lines=50 columns=300
set textwidth=300
"set sessionoptions-=blank
set number
map R :source $MYVIMRC<CR>

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"colorscheme snazzy
"colorscheme deus
"set background=light
"colorscheme PaperColor
"colorscheme PaperColor
"colorscheme dracula
colorscheme afterglow
"colorscheme onedark
"colorscheme onehalfdark
"colorscheme onehalflight
"colorscheme material

syntax on
language C

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

"智能查找 高亮显示结果
set hlsearch    
exec "nohlsearch"    
set incsearch    
set ignorecase        
set smartcase

"避免中文输入法报警
"let g:XkbSwitchLib = 'C:\Program Files\Neovim\bin\libxkbswitch64.dll' 
let g:XkbSwitchEnabled     = 1
let g:XkbSwitchIMappings   = ['cn']
let g:XkbSwitchIMappingsTr = {'cn': {'<': '', '>': ''}}


let g:lightline = { 'colorscheme': 'afterglow'}
"'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lrghter-community' | 'darker-community'
"let g:material_theme_style = 'darker-community'


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  "" Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  "" Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


"vim 内部的TOTO List：undoTree
map <F5> :UndotreeToggle<CR>

"Vim内部的文件树：NERDTreeToggle
map ff :NERDTreeToggle<CR>

let g:airline_theme='afterglow'        "Airline主题
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1      "tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '   "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'      "tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1      
let g:airline_detect_spell=1

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

"帮助你生成当前程序的所有函数和变量索引
"let Tlist_Use_Right_Window=1 
let Tlist_Inc_Winwidth=0 
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_Onluwindow=1
nnoremap <leader>tt :TlistToggle<cr>
nnoremap <leader>tc :TlistClose<cr>
nnoremap <leader>th :TlistHighlightTag<cr>
nnoremap <leader>tu ::TlistUpdate<cr>

let g:clap_theme = 'material_design_dark'
nnoremap <A-n> :tabn<cr>
noremap <F2> :Clap files<cr>
noremap <F4> :Clap grep <cr>
noremap <C-F4> :Clap filer <cr>
noremap <leader>clr :Clap grep <cr>
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
let g:miniBufExplMaxSize = 0
let g:miniBufExplBuffersNeeded = 0
map <Leader>me :MBEOpen<cr>
map <Leader>mc :MBEClose<cr>
map <Leader>mt :MBEToggle<cr>
map <Leader>mf :MBEFocus<cr>
map <Leader>rs :MBEToggleMRU<cr>


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

nnoremap <F3> :CtrlSF 
nnoremap <F6> :CtrlSFUpdate<cr> 
nnoremap <F7> :CtrlSFFocus<cr> 
nnoremap <F8> :CtrlSFToggle<cr> 



" clear all the menus
call quickui#menu#reset()

function! SearchBox()
	let cword = expand('<cword>')
	let title = 'Enter text to search:'
	let text = quickui#input#open(title, cword, 'search')
	if text != ''
        execute "CtrlSF ".text
	endif
endfunc

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&File', [
            \ [ "&Show in Explorer\t(,ocf)", 'call OpenFileLocation()', '在资源管理器中打开'],
            \ [ "&This file as root\t(,cdc)", 'cd %:p:h', '当前文件所在位置作为vim跟目录'],
            \ [ "--", ''],
            \ [ "&Search file\t(F2)", 'Clap files! .<cr>', '搜索文件'],
            \ [ "&Search in file\t(F3)", 'call SearchBox()', '在文件中搜索字符串'],
            \ [ "&Clap filer\t(C-F4)", 'Clap filer <cr>', '文件管理器(Ivy-like file explorer)'],
            \ [ "&Clap grep\t(,clr)", 'Clap grep <cr>', '在文件内搜索，vim-clap中的搜索'],
            \ [ "&CtrlSFUpdate\t(F6)", 'CtrlSFUpdate', '刷新搜索结果'],
            \ [ "&CtrlSFFocus\t(F7)", 'CtrlSFFocus', '定位到搜索窗口'],
            \ [ "&CtrlSFToggle\t(F8)", 'CtrlSFToggle', '打开/关闭搜索窗口'],
            \ [ "--", '' ],
            \ [ "&TlistToggle\t(F4)", 'TlistToggle', '帮助你生成当前程序的所有函数和变量索引'],
            \ [ "--", '' ],
            \ [ "E&xit\tAlt+x", 'echo 6' ],
            \ ])


"工具
call quickui#menu#install('Tools',[
            \ ['$GitTerminal', 'call quickui#terminal#open("cmd", {"w":120, "h":25, "col":70, "line":15, "title":"CODE GIT"})', '打开git控制台'],
            \ ])

" items containing tips, tips will display in the cmdline
call quickui#menu#install('&Edit', [
            \ [ "&UndoTree\t(F5)", 'UndotreeToggle' ],
            \ [ "&NERDTreeFind\t(,nf)", 'NERDTreeFind' ],
            \ [ "&NERDTreeToggle\t(ff)", 'NERDTreeToggle' ],
            \ [ "&NERDTreeRefreshRoot\t(,nr)", 'NERDTreeRefreshRoot' ],
            \ [ "&NERDTreeMirror\t(,nm)", 'NERDTreeMirror' ],
            \ [ "&NERDTreeFocus\t(,no)", 'NERDTreeFocus'],
            \ [ "--", ''],
            \ [ "&Buff next\t(,bn)", 'bnext'],
            \ [ "&Buff previous\t(,bp)", 'bprevious' ],
            \ [ "&Buff first\t(,bf)", 'bfirst'],
            \ [ "&Buff last\t(,bl)", 'blast'],
            \ [ "&Buff\t(,bt)", 'buffer'],
            \ [ "--", ''],
            \ [ "&Open MiniBuf Explorer\t(,me)", 'MBEOpen'],
            \ [ "&Close MiniBuf Explorer\t(,mc)", 'MBEClose'],
            \ [ "&Toggle MiniBuf Explorer\t(,mt)", 'MBEToggle'],
            \ [ "&Focus MiniBuf Explorer\t(,mf)", 'MBEFocus'],
            \ [ "&MRU MiniBuf Explorer\t(,rs)", 'MBEToggleMRU'],
            \ ])

" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
			\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
			\ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
			\ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
			\ ])

" register HELP menu with weight 10000
call quickui#menu#install('H&elp', [
			\ ["&Cheatsheet", 'help index', ''],
			\ ['T&ips', 'help tips', ''],
			\ ['--',''],
			\ ["&Tutorial", 'help tutor', ''],
			\ ['&Quick Reference', 'help quickref', ''],
			\ ['&Summary', 'help summary', ''],
			\ ], 10000)



function! OpenCMList()
    let content = [
            \ [ "coc-diagnostic-prev\t([g)", '<Plug>(coc-diagnostic-prev)' ],
            \ [ "coc-diagnostic-prev\t(]g)", '<Plug>(coc-diagnostic-next)' ],
            \ [ "show documentation\t(K)", 'call <SID>show_documentation()' ],
            \ [ "coc-definition\t(gd)", '<Plug>(coc-definition)' ],
            \ [ "coc-type-definition\t(gy)", '<Plug>(coc-type-definition)' ],
            \ [ "coc-implementation\t(gi)", '<Plug>(coc-implementation)' ],
            \ [ "coc-references\t(gr)", '<Plug>(coc-references)' ],
            \ [ "coc#refresh\t(C-space)", 'coc#refresh()' ],
            \ [ "coc-rename\t(,rn)", '<Plug>(coc-rename)' ],
            \ [ "coc-format-selected\t(,f)", "call CocAction('formatSelected')" ],
            \ [ "coc-codeaction\t(,ac)", '<Plug>(coc-codeaction)' ],
            \ [ "coc-fix-current\t(,qf)", '<Plug>(coc-fix-current)'],
            \ [ "coc-range-select\t(C-s)", '<Plug>(coc-range-select)'],
            \ [ "--", ''],
            \ [ "CocList diagnostics\t(<space>a)", '<C-u>CocList diagnostics<cr>'],
            \ [ "CocList extensions\t(<space>e)", '<C-u>CocList extensions<cr>'],
            \ [ "CocList commands\t(<space>c)", '<C-u>CocList commands<cr>'],
            \ [ "CocList outline\t(<space>o)", '<C-u>CocList outline<cr>'],
            \ [ "CocList -I symbols\t(<space>s)", '<C-u>CocList -I symbols<cr>'],
            \ [ "CocNext\t(<space>j)", '<C-u>CocNext<CR>'],
            \ [ "CocPrev\t(<space>k)", '<C-u>CocPrev<CR>'],
            \ [ "CocListResume\t(<space>p)", '<C-u>CocListResume<CR>'],
            \ [ "--",''],
            \ [ "ale_previous_wrap\t(sp)", '<Plug>(ale_previous_wrap)'],
            \ [ "ale_next_wrap\t(sn)", '<Plug>(ale_next_wrap)'],
            \ [ "ALEToggle\t(,als)", 'ALEToggle<CR>'],
            \ [ "ALEDetail\t(,ald)", 'ALEDetail<CR>'],
            \ ["--", ''],
            \ ["TlistToggle\t(,tt)", ''],
            \ ["TlistClose\t(,tc)", ''],
            \ ["TlistHighlightTag\t(,th)", ''],
            \ ["TlistUpdate\t(,tu)", ''],
            \]
    let opts = {'title': 'select one'}
    call quickui#listbox#open(content, opts)
endfunc

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" hit space twice to open menu
nnoremap <F11> :call quickui#menu#open()<cr> 
nnoremap <F12> :call OpenCMList()<cr>

nnoremap <leader><nowait>om call quickui#menu#open() <cr>
nnoremap <leader><nowait>ol call OpenCMList() <cr>

"字体JetBrains_Mono，需放在配置文件最后面
set guifont=JetBrains_Mono_NL:h11:b:cANSI:qDRAFT
"set guifont=JetBrainsMono_Nerd_Font_Mono:h11:b:cANSI:gDRAFT

"显示输入的命令(右下角)
set showcmd

"当一行代码很长显示不了时，不要自动换行
set nowrap

"设置LF行尾
set ff=unix


"代码块颜色显示
let g:indent_guides_enable_on_vim_startup = 1

"忽略特定的后缀文件名
let g:NERDTreeIgnore = ['\.vim$','\.meta$']  

