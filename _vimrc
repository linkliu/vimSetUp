
call plug#begin('~/.vim/plugged')
Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } } "文件查找插件
Plug 'connorholyday/vim-snazzy'
Plug 'lyokha/vim-xkbswitch'                 "neovim notsupport
Plug 'DeXP/xkb-switch-win'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'} "智能提示
Plug 'luochen1990/rainbow'
Plug 'Raimondi/delimitMate' "Vim自动括号补全
Plug 'vim-scripts/taglist.vim' "11 Vim函数整理,帮助你生成当前程序的所有函数和变量索引，F4激活
Plug 'tbastos/vim-lua' " Lua高亮
Plug 'WolfgangMehner/lua-support' "Lua插件
Plug 'mg979/vim-visual-multi', {'branch': 'master'} "多行选择插件
Plug 'fholgado/minibufexpl.vim' " buffer管理器
Plug 'BurntSushi/ripgrep' " rg
Plug 'scrooloose/syntastic' "语法检测
Plug 'sheerun/vim-polyglot' "代码高亮
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
call plug#end()

let mapleader = ","

" 设置打开文件的编码格式
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8

"设置启动时界面大小
winpos  50 50 "设置初始界面位置
set lines=50 columns=300
set textwidth=300
"set sessionoptions-=blank
set number
map R :source $MYVIMRC<CR>



"colorscheme snazzy
"colorscheme deus
"set background=light
"colorscheme PaperColor
"colorscheme PaperColor
"colorscheme dracula
colorscheme afterglow
"colorscheme onedark
"colorscheme onehalfdark
"colorscheme material
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


"let g:lightline = {
  "\ 'colorscheme': 'onedark',
  "\ }
"'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lrghter-community' | 'darker-community'
"let g:material_theme_style = 'palenight'

"智能提示coc设置
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

set ambiwidth=double                    " 设置为双字宽显示，否则无法完整显示如:☆
let g:airline_theme='afterglow'        "Airline主题
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1      "tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '   "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'      "tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1      
let g:airline_detect_spell=1
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

"帮助你生成当前程序的所有函数和变量索引
"let Tlist_Use_Right_Window=1 
let Tlist_Inc_Winwidth=0 
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_Onluwindow=1
map <F4> :TlistToggle<cr>

nnoremap <A-n> :tabn<cr>
noremap <F2> :Clap files!<cr>
noremap <F4> :Clap grep2 
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
let g:miniBufExplMaxSize = 0
let g:miniBufExplBuffersNeeded = 0
map <Leader>me :MBEOpen<cr>
map <Leader>mc :MBEClose<cr>
map <Leader>mt :MBEToggle<cr>
map <Leader>mf :MBEFocus<cr>
map <Leader>rs :MBEToggleMRU<cr>

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

nnoremap <F3> :CtrlSF 
nnoremap <F6> :CtrlSFUpdate<cr> 
nnoremap <F9> :CtrlSFFocus<cr> 
nnoremap <F10> :CtrlSFToggle<cr> 
nnoremap <F11> :CtrlSFToggleMap<cr> 

"显示输入的命令(右下角)
set showcmd

"当一行代码很长显示不了时，不要自动换行
set nowrap

"设置LF行尾
set ff=unix
